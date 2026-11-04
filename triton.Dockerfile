ARG BASE_IMAGE=swr.cn-north-4.myhuaweicloud.com/hw-ascend/manylinux_2_28_x86:latest
FROM ${BASE_IMAGE}

RUN yum makecache && \
    yum install -y wget \
        zlib-devel libffi-devel openssl-devel \
        bzip2-devel xz-devel sqlite-devel \
        readline-devel ncurses-devel gdbm-devel && \
    yum clean all && \
    rm -rf /var/cache/yum

ENV PATH=/opt/python/cp312-cp312/bin:${PATH}

RUN set -e; \
    for real in /opt/_internal/cpython-*; do \
      base=$(basename "${real}"); \
      [ -d "${real}" ] || continue; \
      ver=$(printf '%s' "${base}" | sed -E 's/^cpython-([0-9.]+)(-nogil)?$/\1/'); \
      short=$(printf '%s' "${ver}" | cut -d. -f1-2); \
      tag=""; gil_flag=""; \
      case "${base}" in \
        *-nogil) tag="t"; gil_flag="--disable-gil";; \
      esac; \
      libbase="libpython${short}${tag}"; \
      echo "== building ${base} (${ver}) =="; \
      curl -fsSL -o /tmp/py.tgz "https://mirrors.huaweicloud.com/python/${ver}/Python-${ver}.tgz" && \
      tar -xzf /tmp/py.tgz -C /tmp && \
      cd "/tmp/Python-${ver}" && \
      ./configure --enable-shared ${gil_flag} --prefix="${real}" >/dev/null && \
      make -j"$(nproc)" >/dev/null && \
      cp -f "${libbase}.so.1.0" "${real}/lib/" && \
      ln -sf "${libbase}.so.1.0" "${real}/lib/${libbase}.so" && \
      cp -f libpython3.so "${real}/lib/" && \
      readelf -d "${real}/lib/libpython3.so" | grep -q 'SONAME.*libpython3.so' && \
      printf '%s\n' \
        '#include <Python.h>' \
        'int main(){ Py_Initialize(); printf("EMBED_OK %s\n", Py_GetVersion()); Py_Finalize(); return 0; }' \
        > /tmp/embed_test.c && \
      gcc /tmp/embed_test.c -I"${real}/include/python${short}${tag}" -L"${real}/lib" -l"${libbase#lib}" -o /tmp/embed_test && \
      LD_LIBRARY_PATH="${real}/lib" /tmp/embed_test && \
      cd /tmp && rm -rf "/tmp/Python-${ver}" /tmp/py.tgz /tmp/embed_test /tmp/embed_test.c; \
    done; \
    ln -sf /lib64/libpython3.12.so.1.0 /lib64/libpython3.12.so && \
    ln -sf /lib64/libpython3.11.so.1.0 /lib64/libpython3.11.so && \
    ln -sf /lib64/libpython3.12.so.1.0 /lib64/libpython3.so && \
    pip3 --version && \
    python3-config --ldflags --embed

RUN ARCH=$(uname -m) && \
    case "$ARCH" in \
      x86_64)  LLVM_ARCH=x64 ;; \
      aarch64) LLVM_ARCH=arm64 ;; \
      *) echo "Unsupported architecture: ${ARCH}" >&2; exit 1 ;; \
    esac && \
    curl -fsSL -o /tmp/llvm.tar.gz \
      "https://triton-ascend-artifacts.obs.myhuaweicloud.com/llvm-builds/llvm-f6ded0be-4ca23101-almalinux-${LLVM_ARCH}.tar.gz" && \
    tar -xzf /tmp/llvm.tar.gz -C /opt && \
    rm -f /tmp/llvm.tar.gz && \
    ln -sfn "/opt/llvm-f6ded0be-4ca23101-almalinux-${LLVM_ARCH}" /opt/llvm && \
    /opt/llvm/bin/llc --version | head -2 && \
    /opt/llvm/bin/llvm-config --version

RUN ARCH=$(uname -m) && \
    case "$ARCH" in \
      x86_64)  CANN_ARCH=x86_64 ;; \
      aarch64) CANN_ARCH=aarch64 ;; \
      *) echo "Unsupported architecture: ${ARCH}" >&2; exit 1 ;; \
    esac && \
    curl -fsSL -o /tmp/cann.run \
      "https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%209.1.T1/Ascend-cann-toolkit_9.1.0-beta.1_linux-${CANN_ARCH}.run" && \
    chmod +x /tmp/cann.run && \
    /tmp/cann.run --install --quiet && \
    rm -f /tmp/cann.run && \
    test -f /usr/local/Ascend/cann/set_env.sh && \
    echo "CANN installed: $(cat /etc/Ascend/ascend_cann_install.info 2>/dev/null | grep -i toolkit | head -1)"


RUN printf 'source /usr/local/Ascend/cann/set_env.sh\n' > /etc/profile.d/ascend-cann.sh

CMD ["/bin/bash"]

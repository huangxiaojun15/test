{
  "metadata": {
    "repo_url": "https://gitcode.com/openeuler/OmniStateStore.git",
    "branch": "master",
    "start_time": "2026-09-29T18:32:01",
    "end_time": "2026-09-29T19:08:06",
    "duration_seconds": 2165,
    "total_steps": 29,
    "commit": "171784a",
    "environment": "openEuler 24.03 LTS-SP3 (aarch64, Kunpeng 920), Docker 18.09.0, GCC 12.3.1, CMake 3.27.9, OpenJDK 1.8.0_502, Maven 3.6.3, mold 2.34.1, Maven华为云镜像源(repo.huaweicloud.com)",
    "verifier": "opencode / ttfhw-verify-smart"
  },
  "token_usage": {
    "tool": "opencode",
    "model": "glm-5.2",
    "input_tokens": 0,
    "output_tokens": 0,
    "cache_hit_tokens": 0,
    "cache_miss_tokens": 0
  },
  "machine_spec": {
    "host_machine": {
      "architecture": "aarch64",
      "cpu_model": "Kunpeng 920 72F8 (HiSilicon)",
      "cpu_cores": 601,
      "memory": "1.0Ti",
      "disk": "492G (可用16G)",
      "docker_version": "18.09.0",
      "npu": {
        "available": false,
        "card_count": 0,
        "mounted_card_id": null
      }
    },
    "container": {
      "os": "openEuler 24.03 LTS-SP3",
      "architecture": "aarch64",
      "cpu_cores": 601,
      "memory": "1.0Ti",
      "container_name": "omn-ttfhw"
    },
    "image_source": {
      "type": "base_image",
      "image_name": "swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest (本地缓存, IMAGE ID 98eb89c5ec3b, 1.67GB)",
      "selection_reason": "Tier 1 业务预构建镜像: installation_guide.md容器环境部署章节明确推荐docker pull, .devcontainer/devcontainer.json指定同一镜像. 镜像为ARM64/aarch64与宿主机架构匹配, 基于openEuler 24.03 LTS-SP3, 预装GCC 12.3.1/CMake 3.27.9/OpenJDK 1.8.0_502/Maven 3.6.3/libaio-devel/libasan. 本地缓存镜像名和tag与文档推荐完全一致, 跳过拉取. 旧版镜像未含mold和Maven华为云mirror配置, 容器内补装mold 2.34.1并配置Maven settings.xml指向华为云镜像源(repo.huaweicloud.com)"
    }
  },
  "document_reading_summary": {
    "architecture": {
      "source": "installation_guide.md 硬件配置要求表 + development_guide.md 硬件依赖 + 宿主机lscpu",
      "value": "aarch64 (鲲鹏920 Kunpeng-920, 601核, 1.0Ti内存)"
    },
    "recommended_image": {
      "source": "installation_guide.md 容器环境部署章节 + .devcontainer/devcontainer.json + docker/README.md",
      "value": "Tier 1 预构建镜像: swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest (ARM64/aarch64, 基于openEuler 24.03 LTS-SP3, 预装GCC/CMake/OpenJDK 8/Maven/libaio-devel/libasan/mold, 摘要sha256:46b647673b9ce152b2e519e26b6f32c125e2acadbfc9cd7e6f1b0e2ff7e1dbdd); Tier 2 备选: Dockerfile构建 (基于 hub.oepkgs.net/openeuler/openeuler:24.03-lts-sp3); 注意: 旧版镜像(2026-09-18)未含mold和Maven华为云mirror配置, 当前Dockerfile已添加"
    },
    "dockerfile_dependencies": {
      "source": "docker/Dockerfile",
      "value": [
        {
          "original": "dnf install -y gcc gcc-c++ make cmake java-1.8.0-openjdk-devel maven git libaio-devel libasan tar gzip which findutils gawk sed grep coreutils diffutils mold",
          "target_equivalent": "dnf install -y gcc gcc-c++ make cmake java-1.8.0-openjdk-devel maven git libaio-devel libasan tar gzip which findutils gawk sed grep coreutils diffutils mold"
        }
      ]
    },
    "dependencies": {
      "source": "docker/Dockerfile + CMakeLists.txt + .gitmodules + development_guide.md 编译依赖表",
      "value": [
        "gcc",
        "gcc-c++",
        "cmake (>=3.14.1)",
        "java-1.8.0-openjdk-devel (JDK 1.8.0_432)",
        "maven",
        "git",
        "libaio-devel",
        "libasan",
        "mold (并行链接器)",
        "googletest v1.16.0 (git submodule)",
        "lz4 v1.10.0 (git submodule)",
        "libboundscheck (git submodule)",
        "spdlog v1.15.3 (git submodule)"
      ]
    },
    "build_commands": {
      "source": "installation_guide.md 编译与安装章节 + development_guide.md 源码编译章节 + scripts/build.sh",
      "value": "docker exec omn-ttfhw bash -lc 'cd /workspace && bash scripts/build.sh -t release'"
    },
    "ut_commands": {
      "source": "installation_guide.md 可选：单元测试章节 + development_guide.md 测试指导章节",
      "value": "docker exec omn-ttfhw bash -lc 'cd /workspace && bash scripts/build.sh -t debug --ut && cd build/test/llt && ./bss_ut'"
    },
    "special_dependencies": {
      "source": ".gitmodules + docker/Dockerfile + development_guide.md + docker/Dockerfile Maven镜像配置",
      "value": [
        "OpenJDK 8 (JAVA_HOME, 含jni.h头文件)",
        "Maven (Dockerfile配置华为云mirror https://repo.huaweicloud.com/repository/maven/ 但旧版镜像未含此配置, 需手动补配)",
        "mold (LDFLAGS=-fuse-ld=mold, 需GCC 12.1+)",
        "libaio-devel (Native UT依赖)",
        "libasan (ASan, Native UT依赖)",
        "git submodule: googletest/lz4/libboundscheck/spdlog (均在gitcode.com)"
      ]
    }
  },
  "execution_log": [
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 README.md 提取构建依赖和命令",
      "result": "成功",
      "details": {
        "file": "README.md"
      },
      "command": "cat README.md",
      "success": true,
      "output": "OmniStateStore是基于Flink状态存储后端标准接口实现的存储引擎, 鲲鹏920, 链接至installation_guide.md和quick_start.md",
      "error": "",
      "returncode": 0,
      "duration_seconds": 5
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 docs/zh/installation_guide.md 容器环境部署章节",
      "result": "成功",
      "details": {
        "file": "docs/zh/installation_guide.md",
        "section": "容器环境部署"
      },
      "command": "cat docs/zh/installation_guide.md",
      "success": true,
      "output": "预构建镜像: docker pull swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest (ARM64); Dockerfile构建; 容器启动: docker run --mount bind; 构建: bash scripts/build.sh -t release; UT: bash scripts/build.sh ",
      "error": "",
      "returncode": 0,
      "duration_seconds": 8
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 docs/zh/development_guide.md 编译构建与测试指导",
      "result": "成功",
      "details": {
        "file": "docs/zh/development_guide.md",
        "section": "编译构建 + 测试指导"
      },
      "command": "cat docs/zh/development_guide.md",
      "success": true,
      "output": "编译依赖: openEuler 20.03/22.03/24.03, CMake 3.22.0, GCC 10.3.1, JDK 1.8.0_432; 构建: bash scripts/build.sh -t release; UT: bash scripts/build.sh -t debug --ut -j 8 && cd build/test/llt && ./bss_ut; mold加速链",
      "error": "",
      "returncode": 0,
      "duration_seconds": 6
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 docs/zh/quick_start.md 编译构建与开发者测试",
      "result": "成功",
      "details": {
        "file": "docs/zh/quick_start.md",
        "section": "编译构建 + 开发者测试"
      },
      "command": "cat docs/zh/quick_start.md",
      "success": true,
      "output": "硬件: Kunpeng-920 aarch64 32GB+; 构建: bash scripts/build.sh -t release; UT: bash scripts/build.sh -t debug --ut -j 8 && (cd build/test/llt && ./bss_ut --gtest_output=xml:report.xml)",
      "error": "",
      "returncode": 0,
      "duration_seconds": 5
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 docker/Dockerfile 提取FROM镜像和安装依赖",
      "result": "成功",
      "details": {
        "file": "docker/Dockerfile"
      },
      "command": "cat docker/Dockerfile",
      "success": true,
      "output": "FROM hub.oepkgs.net/openeuler/openeuler:24.03-lts-sp3; RUN dnf install gcc gcc-c++ make cmake java-1.8.0-openjdk-devel maven git libaio-devel libasan mold; ENV JAVA_HOME=/opt/java LDFLAGS=-fuse-ld=mol",
      "error": "",
      "returncode": 0,
      "duration_seconds": 4
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 docker/README.md 镜像发布与拉取说明",
      "result": "成功",
      "details": {
        "file": "docker/README.md"
      },
      "command": "cat docker/README.md",
      "success": true,
      "output": "ARM64预构建镜像: swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest; 摘要sha256:46b6476...; 旧版镜像(2026-09-18)尚未包含mold及Maven预热改动; 2026-09-29按当前Dockerfile构建临时验证镜像, Maven预热完成",
      "error": "",
      "returncode": 0,
      "duration_seconds": 4
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 .devcontainer/devcontainer.json 提取镜像配置",
      "result": "成功",
      "details": {
        "file": ".devcontainer/devcontainer.json"
      },
      "command": "cat .devcontainer/devcontainer.json",
      "success": true,
      "output": "image: swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest; workspaceFolder: /workspace; remoteUser: root",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 scripts/build.sh 提取构建脚本逻辑",
      "result": "成功",
      "details": {
        "file": "scripts/build.sh"
      },
      "command": "cat scripts/build.sh",
      "success": true,
      "output": "build.sh -t release/debug/blend [--ut] [--fv <version>] [-j <jobs>]; 默认BSS_BUILD_JOBS=8; 自动git submodule update --init --recursive; check glibc>=2.10; clean build/dist",
      "error": "",
      "returncode": 0,
      "duration_seconds": 4
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 CMakeLists.txt 提取构建配置和依赖",
      "result": "成功",
      "details": {
        "file": "CMakeLists.txt"
      },
      "command": "cat CMakeLists.txt",
      "success": true,
      "output": "cmake_minimum_required 3.14.1; C++14; 需JAVA_HOME/jni.h; 4个git submodule(googletest/lz4/libboundscheck/spdlog); BUILD_TESTS/BUILD_SVE选项; build_all目标编译4个Flink版本",
      "error": "",
      "returncode": 0,
      "duration_seconds": 4
    },
    {
      "timestamp": "2026-09-29T18:32:39",
      "step": "document_reading",
      "action": "阅读 .gitmodules 提取子模块依赖",
      "result": "成功",
      "details": {
        "file": ".gitmodules"
      },
      "command": "cat .gitmodules",
      "success": true,
      "output": "4个子模块: googletest v1.16.0 (gitcode.com), lz4 v1.10.0 (gitcode.com), libboundscheck (gitcode.com/src-openeuler), spdlog v1.15.3 (gitcode.com)",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "image_selection",
      "action": "选择Tier 1预构建镜像",
      "result": "Tier 1 业务预构建镜像",
      "details": {
        "image": "swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest",
        "tier": "Tier 1",
        "arch": "aarch64"
      },
      "command": "docker images | grep omnistatestore",
      "success": true,
      "output": "本地缓存命中: swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest, IMAGE ID 98eb89c5ec3b, 1.67GB. 镜像名和tag与文档推荐完全一致, 跳过拉取",
      "error": "",
      "returncode": 0,
      "duration_seconds": 5
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "container_setup",
      "action": "远程clone仓库及子模块到/home/workspace/OmniStateStore-verify",
      "result": "成功",
      "details": {
        "path": "/home/workspace/OmniStateStore-verify",
        "commit": "171784a",
        "submodules": 4
      },
      "command": "ssh root@123.60.114.33 'git clone --recurse-submodules --depth 1 --branch master https://gitcode.com/openeuler/OmniStateStore.git'",
      "success": true,
      "output": "Clone成功, commit 171784a, 4个子模块(googletest v1.16.0/lz4 v1.10.0/libboundscheck/spdlog v1.15.3)均已初始化",
      "error": "",
      "returncode": 0,
      "duration_seconds": 28
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "container_setup",
      "action": "启动容器omn-ttfhw, 挂载源码到/workspace",
      "result": "成功",
      "details": {
        "container": "omn-ttfhw",
        "mount": "bind:/home/workspace/OmniStateStore-verify:/workspace",
        "image": "swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest"
      },
      "command": "docker run -d --name omn-ttfhw --mount type=bind,source=/home/workspace/OmniStateStore-verify,target=/workspace swr.cn-north-4.myhuaweicloud.com/ubscore/omnistatestore:latest",
      "success": true,
      "output": "容器cf3aef7b4542启动成功, 状态Up",
      "error": "",
      "returncode": 0,
      "duration_seconds": 3
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "dependency_verification",
      "action": "验证容器内GCC版本",
      "result": "成功",
      "details": {
        "tool": "gcc",
        "version": "12.3.1"
      },
      "command": "docker exec omn-ttfhw bash -c 'gcc --version'",
      "success": true,
      "output": "gcc (GCC) 12.3.1 (openEuler 12.3.1-111.oe2403sp3)",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "dependency_verification",
      "action": "验证容器内CMake版本",
      "result": "成功",
      "details": {
        "tool": "cmake",
        "version": "3.27.9"
      },
      "command": "docker exec omn-ttfhw bash -c 'cmake --version'",
      "success": true,
      "output": "cmake version 3.27.9",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "dependency_verification",
      "action": "验证容器内OpenJDK版本",
      "result": "成功",
      "details": {
        "tool": "java",
        "version": "1.8.0_502",
        "java_home": "/opt/java"
      },
      "command": "docker exec omn-ttfhw bash -c 'java -version && echo $JAVA_HOME'",
      "success": true,
      "output": "openjdk version 1.8.0_502 BiSheng, JAVA_HOME=/opt/java, jni.h存在",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "dependency_verification",
      "action": "验证容器内Maven版本",
      "result": "成功",
      "details": {
        "tool": "maven",
        "version": "3.6.3"
      },
      "command": "docker exec omn-ttfhw bash -c 'mvn -v'",
      "success": true,
      "output": "Apache Maven 3.6.3 (openEuler 3.6.3-2)",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "dependency_verification",
      "action": "验证容器内libaio和libasan",
      "result": "成功",
      "details": {
        "libaio": "/usr/lib64/libaio.so.1",
        "libasan": "随gcc安装"
      },
      "command": "docker exec omn-ttfhw bash -c 'ls /usr/lib64/libaio*'",
      "success": true,
      "output": "libaio.so/libaio.so.1/libaio.so.1.0.2存在, libasan随gcc安装",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "dependency_verification",
      "action": "验证容器内glibc版本",
      "result": "成功",
      "details": {
        "glibc": "2.38"
      },
      "command": "docker exec omn-ttfhw bash -c 'getconf GNU_LIBC_VERSION'",
      "success": true,
      "output": "glibc 2.38 (>=2.10, 满足build.sh要求)",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "dependency_installation",
      "action": "容器内安装mold 2.34.1(旧版镜像未含)",
      "result": "成功",
      "details": {
        "package": "mold",
        "version": "2.34.1"
      },
      "command": "docker exec omn-ttfhw bash -c 'dnf install -y mold'",
      "success": true,
      "output": "mold 2.34.1-2.oe2403sp3.aarch64安装成功, compatible with GNU ld",
      "error": "",
      "returncode": 0,
      "duration_seconds": 15
    },
    {
      "timestamp": "2026-09-29T18:35:24",
      "step": "dependency_installation",
      "action": "配置Maven华为云镜像源(旧版镜像未含settings.xml)",
      "result": "成功",
      "details": {
        "config_file": "/root/.m2/settings.xml",
        "mirror_url": "https://repo.huaweicloud.com/repository/maven/",
        "mirror_of": "central"
      },
      "command": "docker exec omn-ttfhw bash -c 'mkdir -p /root/.m2 && cat > /root/.m2/settings.xml <<EOF ... EOF'",
      "success": true,
      "output": "写入/root/.m2/settings.xml, 将central镜像到https://repo.huaweicloud.com/repository/maven/. 对应Dockerfile第24-31行的Maven配置, 上次验证因缺失此配置导致Maven从repo.maven.apache.org慢速下载(3-37kB/s)",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:49:14",
      "step": "build_attempt",
      "action": "后台启动release构建(LDFLAGS=-fuse-ld=mold, -j 180)",
      "result": "成功",
      "details": {
        "build_type": "release",
        "jobs": 180,
        "ldflags": "-fuse-ld=mold"
      },
      "command": "docker exec -d omn-ttfhw bash -c 'cd /workspace && export LDFLAGS=-fuse-ld=mold && bash scripts/build.sh -t release -j 180 > /tmp/build_release.log 2>&1; echo DONE_EXIT_$? >> /tmp/build_release.log'",
      "success": true,
      "output": "构建后台启动, 输出重定向到/tmp/build_release.log",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T18:49:14",
      "step": "build_attempt",
      "action": "CMake配置和C++编译(含3rdparty子模块构建+LTO链接)",
      "result": "成功",
      "details": {
        "phase": "cmake_configure_and_cpp_build",
        "progress": "100%",
        "linker": "mold"
      },
      "command": "docker exec omn-ttfhw bash -c 'tail -5 /tmp/build_release.log'",
      "success": true,
      "output": "CMake配置成功, C++编译100%完成, 含googletest/lz4/libboundscheck/spdlog子模块构建, LTO链接libockdbjni-linux64.so完成",
      "error": "",
      "returncode": 0,
      "duration_seconds": 300
    },
    {
      "timestamp": "2026-09-29T18:49:14",
      "step": "build_attempt",
      "action": "Maven打包4个Flink版本(华为云镜像源加速)",
      "result": "成功",
      "details": {
        "phase": "maven_package",
        "flink_versions": [
          "1.16.1",
          "1.16.3",
          "1.17.1",
          "1.20.0"
        ],
        "mirror": "https://repo.huaweicloud.com/repository/maven/"
      },
      "command": "docker exec omn-ttfhw bash -c 'tail -5 /tmp/build_release.log'",
      "success": true,
      "output": "Maven打包4个Flink版本JAR全部成功, 使用华为云镜像源(repo.huaweicloud.com)加速下载, 上次660s→本次约240s. 下载源: Downloaded from central-mirror: https://repo.huaweicloud.com/repository/maven/",
      "error": "",
      "returncode": 0,
      "duration_seconds": 240
    },
    {
      "timestamp": "2026-09-29T18:49:14",
      "step": "build_attempt",
      "action": "验证构建产物",
      "result": "成功",
      "details": {
        "artifacts": [
          "tar.gz",
          "4 jars"
        ],
        "tar_gz_size": "9.1M",
        "jar_size": "2.4M each"
      },
      "command": "docker exec omn-ttfhw bash -c 'ls -lh /workspace/dist/'",
      "success": true,
      "output": "dist/BoostKit-omnistatestore_1.1.0_aarch64_release.tar.gz(9.1M) + 4个Flink JAR(各2.4M). DONE_EXIT_0",
      "error": "",
      "returncode": 0,
      "duration_seconds": 5
    },
    {
      "timestamp": "2026-09-29T19:07:39",
      "step": "ut_execution",
      "action": "后台启动debug UT构建和测试(LDFLAGS=-fuse-ld=mold, -j 180)",
      "result": "成功",
      "details": {
        "build_type": "debug",
        "ut": true,
        "jobs": 180,
        "ldflags": "-fuse-ld=mold"
      },
      "command": "docker exec -d omn-ttfhw bash -c 'cd /workspace && export LDFLAGS=-fuse-ld=mold && bash scripts/build.sh -t debug --ut -j 180 > /tmp/ut_full.log 2>&1 && cd build/test/llt && ./bss_ut --gtest_output=xml:report.xml >> /tmp/ut_full.log 2>&1; echo DONE_EXIT_$? >> /tmp/ut_full.log'",
      "success": true,
      "output": "UT构建和测试后台启动, 输出重定向到/tmp/ut_full.log",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    },
    {
      "timestamp": "2026-09-29T19:07:39",
      "step": "ut_execution",
      "action": "debug UT构建(CMake配置+C++编译+链接, ASan覆盖率模式)",
      "result": "成功",
      "details": {
        "phase": "debug_build",
        "build_type": "debug",
        "asan": true,
        "coverage": true
      },
      "command": "docker exec omn-ttfhw bash -c 'tail -5 /tmp/ut_full.log'",
      "success": true,
      "output": "debug构建完成: 3rdparty+src全部编译成功, bss_ut二进制链接成功(mold加速), ASan覆盖率模式-fprofile-arcs -ftest-coverage",
      "error": "",
      "returncode": 0,
      "duration_seconds": 370
    },
    {
      "timestamp": "2026-09-29T19:07:39",
      "step": "ut_execution",
      "action": "执行bss_ut单元测试(GoogleTest, 366测试/35套件)",
      "result": "成功",
      "details": {
        "total": 366,
        "passed": 366,
        "failed": 0,
        "suites": 35,
        "duration_ms": 530271
      },
      "command": "docker exec omn-ttfhw bash -c './bss_ut --gtest_output=xml:report.xml'",
      "success": true,
      "output": "[==========] 366 tests from 35 test suites ran. (530271 ms total) [  PASSED  ] 366 tests. DONE_EXIT_0",
      "error": "",
      "returncode": 0,
      "duration_seconds": 530
    },
    {
      "timestamp": "2026-09-29T19:07:39",
      "step": "ut_execution",
      "action": "验证GoogleTest XML报告生成",
      "result": "成功",
      "details": {
        "report_path": "/workspace/build/test/llt/report.xml",
        "report_size": "102265 bytes"
      },
      "command": "docker exec omn-ttfhw bash -c 'ls -la /workspace/build/test/llt/report.xml'",
      "success": true,
      "output": "report.xml生成成功, 102265字节, 包含366个测试用例的详细结果",
      "error": "",
      "returncode": 0,
      "duration_seconds": 2
    }
  ],
  "final_results": {
    "build": {
      "status": "success",
      "duration_seconds": 780,
      "cmake": "cmake 3.27.9 (CMAKE_BUILD_TYPE=Release, BSS_BUILD_JOBS=180)",
      "compiler": "gcc 12.3.1 (openEuler), mold 2.34.1 linker",
      "concurrency": 180,
      "concurrency_ratio": "30% (601核 * 30% = 180)",
      "notes": "LDFLAGS=-fuse-ld=mold; C++编译+LTO链接约5分钟, Maven打包4个Flink版本约4分钟(华为云镜像源加速, 上次660s→本次约240s); 生成release tar.gz和4个Flink版本JAR",
      "artifacts": [
        {
          "name": "BoostKit-omnistatestore_1.1.0_aarch64_release.tar.gz",
          "path": "dist/BoostKit-omnistatestore_1.1.0_aarch64_release.tar.gz",
          "size": "9.1M",
          "type": "tar.gz"
        },
        {
          "name": "flink-boost-statebackend-1.1.0-SNAPSHOT-for-flink-1.16.1.jar",
          "path": "dist/BoostKit-omnistatestore_1.1.0/java/jars/flink-boost-statebackend-1.1.0-SNAPSHOT-for-flink-1.16.1.jar",
          "size": "2.4M",
          "type": "jar"
        },
        {
          "name": "flink-boost-statebackend-1.1.0-SNAPSHOT-for-flink-1.16.3.jar",
          "path": "dist/BoostKit-omnistatestore_1.1.0/java/jars/flink-boost-statebackend-1.1.0-SNAPSHOT-for-flink-1.16.3.jar",
          "size": "2.4M",
          "type": "jar"
        },
        {
          "name": "flink-boost-statebackend-1.1.0-SNAPSHOT-for-flink-1.17.1.jar",
          "path": "dist/BoostKit-omnistatestore_1.1.0/java/jars/flink-boost-statebackend-1.1.0-SNAPSHOT-for-flink-1.17.1.jar",
          "size": "2.4M",
          "type": "jar"
        },
        {
          "name": "flink-boost-statebackend-1.1.0-SNAPSHOT-for-flink-1.20.0.jar",
          "path": "dist/BoostKit-omnistatestore_1.1.0/java/jars/flink-boost-statebackend-1.1.0-SNAPSHOT-for-flink-1.20.0.jar",
          "size": "2.4M",
          "type": "jar"
        }
      ]
    },
    "ut": {
      "status": "success",
      "duration_seconds": 900,
      "total": 366,
      "passed": 366,
      "failed": 0,
      "failures": [],
      "skipped": 0,
      "cpp": {
        "status": "success",
        "total": 366,
        "passed": 366,
        "failed": 0,
        "note": "debug构建约370秒(-j180, LDFLAGS=-fuse-ld=mold, ASan覆盖率模式), bss_ut执行530秒(366测试/35套件全部通过), GoogleTest XML报告102KB生成于build/test/llt/report.xml"
      }
    }
  },
  "documentation_gaps": [],
  "problems_encountered": [
    {
      "timestamp": "2026-09-29T18:32:01",
      "problem": "本地缓存的Tier 1预构建镜像(2026-09-18版本)未包含mold并行链接器和Maven华为云mirror配置, 当前Dockerfile已添加这两项",
      "solution": "在容器内执行dnf install -y mold安装mold 2.34.1; 同时写入/root/.m2/settings.xml将central镜像到https://repo.huaweicloud.com/repository/maven/(对应Dockerfile第24-31行). 上次验证因缺失Maven mirror配置导致Maven从repo.maven.apache.org慢速下载(3-37kB/s, 660s), 本次配置后Maven从华为云下载(约240s, 提速约2.75倍)",
      "source": "docker/README.md 镜像验证记录 + docker/Dockerfile Maven配置段"
    }
  ]
}

#!/bin/bash
set -e

function search_npuir_newest()
{
    echo "#######################search_npuir_newest#######################"
    local  npuir_component_name_r="$1"
    local  npuir_version_r="$2"
    local  npuir_offering_r="$3"
    artget search "${npuir_component_name_r} ${npuir_version_r}" --offering "${npuir_offering_r}" -vo ./my_version.json -ru software -fl -ap ./ -user "p_OckCI" -pwd "${cmc_passwd}"
    folder_name=$(grep -Eo '"fileName":"[^"]*"' ./my_version.json | 
        awk -F'"' '{print $4}' | 
        grep -E '^[0-9]{14,17}$' | 
        # 标准化为17位进行比较
        awk '{
            if (length($0) == 14) print $0 "000"
            else if (length($0) == 15) print $0 "00" 
            else if (length($0) == 16) print $0 "0"
            else print $0
        }' | 
        sort -r | head -1 | 
        # 还原为原始格式
        sed 's/000$//')
    echo "${folder_name}"
    echo "${folder_name}" > npuir_folder.txt
}

function set_proxy()
{
    git config --global http.sslVerify false
    export GIT_SSL_NO_VERIFY=true
    proxy="http://p_atlas:${p_atlas_passwd}@hkgpqwg00206.huawei.com:8080"
    export http_proxy="${proxy}"
    export https_proxy="${proxy}"
    export no_proxy="127.0.0.1,*.huawei.com,localhost,local,.local,7.218.30.174"
    git config --global http.postBuffer 524288000
}

function unset_proxy()
{
    unset http_proxy
    unset https_proxy
    unset no_proxy
}

function git_clone_triton_ascend()
{
    local  triton_ascend_repo_r="$1"
    local  triton_ascend_branch_r="$2"
    rm -rf triton-ascend
    git clone -b "${triton_ascend_branch_r}" "${triton_ascend_repo_r}" triton-ascend --depth 1
    cd triton-ascend
    git submodule update --init --depth 1
    cd ..
    tar -zcf triton-ascend_code.tar.gz triton-ascend/
}

function artget_push()
{
    local  offering_name_r="$1"
    local  component_name_r="$2"
    local  B_Version_r="$3"
    local  pkg_path_r="$4"
    local  rp_path_r="$5"
    local  repousage_r="$6"

    if [ -f dependency.xml ];then
        rm -f dependency.xml
    fi
    touch dependency.xml
    cat > dependency.xml << EOF
<?xml version="1.0" encoding="UTF-8"?> 
<project>
    <artifact>
        <versionType>Component</versionType>
        <repoType>Generic</repoType>
        <id>
            <offering>${offering_name_r}</offering>
            <componentName>${component_name_r}</componentName>
            <componentVersion>${B_Version_r}</componentVersion>
        </id>
        <isClear>N</isClear>
        <copies>
            <copy>
                <repoUsage>${repousage_r}</repoUsage>
                <source>${pkg_path_r}</source>
                <dest>${rp_path_r}</dest>
            </copy>
        </copies>
    </artifact>
</project>
EOF
    artget push -d dependency.xml -ap $WORKSPACE/ -user "p_OckCI" -pwd "${cmc_passwd}"
}

function artget_pull()
{
    local  offering_name_r="$1"
    local  component_name_r="$2"
    local  B_Version_r="$3"
    local  pkg_path_r="$4"
    local  ap_path_r="$5"
    local  repousage_r="$6"

    if [ -f dependency.xml ];then
        rm -f dependency.xml
    fi
    touch dependency.xml
    cat > dependency.xml << EOF
<?xml version="1.0" encoding="UTF-8"?> 
<project>
    <dependencies>
        <dependency>
            <versionType>Component</versionType>
            <repoType>Generic</repoType>
            <id>
                <offering>${offering_name_r}</offering>
                <componentName>${component_name_r}</componentName>
                <componentVersion>${B_Version_r}</componentVersion>
            </id>
            <copies>
                <copy>
                    <repoUsage>${repousage_r}</repoUsage>
                    <source>${pkg_path_r}</source>
                    <dest>${ap_path_r}</dest>
                </copy>
            </copies>
        </dependency>
    </dependencies>
</project>
EOF
    artget pull -d dependency.xml -ap $WORKSPACE/ -user "p_OckCI" -pwd "${cmc_passwd}"
}

function conf_triton_ascend_code()
{
    local  npuir_path_r="$1"
    local  triton_ascend_path_r="$2"
    local  arch_r="$3"
    cd "${npuir_path_r}"
    chmod +x ascendnpu-ir*${arch_r}.run
    ./ascendnpu-ir*${arch_r}.run --noexec --extract=$WORKSPACE/npuir
    cd "${triton_ascend_path_r}"
    tar -zxf triton-ascend_code.tar.gz
    cp -r $WORKSPACE/npuir/bishengir triton-ascend/third_party/ascend/backend/
}

function conf_remote_ccache()
{
    local  job_name_r="$1"
    echo "remote_storage = http://7.218.30.174/cache/" > /root/.ccache/ccache.conf
    echo "remote_only = true" >> /root/.ccache/ccache.conf
    echo "remote_timeout = 30" >> /root/.ccache/ccache.conf
    echo "compression = true" >> /root/.ccache/ccache.conf
    echo "compression_level = 6" >> /root/.ccache/ccache.conf
    echo "namespace = ${job_name_r}" >> /root/.ccache/ccache.conf
    cat /root/.ccache/ccache.conf
}

function git_clone_shmem()
{
    local  shmem_repo="$1"
    local  shmem_branch="$2"
    rm -rf shmem
    git clone -b "${shmem_branch}" "${shmem_repo}" shmem --depth 1
    cd shmem
    mkdir -p 3rdparty
    git clone --branch v3.11.3 --depth 1 https://gitcode.com/GitHub_Trending/js/json.git 3rdparty/json
    cd ..
    tar -zcf shmem_code.tar.gz shmem/
}

function retry_func()
{
    command_r="$@"
    count=0
	until (${command_r})
	do
		echo "Command failed, retrying..."
		sleep 10
		count=$((count + 1))
		if [ "$count" -ge 10 ]; then
			echo "Failed after 10 attempts."
			exit 1
		fi
	done
}

function triton_build()
{
    local llvm_name_r="$1"
    local python_version_r="$2"
    local folder_r="$3"

    export CXX=/usr/bin/clang++-15
    export CC=/usr/bin/clang-15
    LLVM_SYSPATH_TEMP="/opt/${llvm_name_r}"
    export TRITON_BUILD_TD=ON
    if [ -f setup_ascend.py ]; then
        SETUP_PY="setup_ascend.py"
    elif [ -f setup.py ]; then
        SETUP_PY="setup.py"
    else
        echo "SETUP_PY not exist"
    fi
    export PYTHON_HOME="/opt/python/${python_version_r}"
    export CMAKE_PREFIX_PATH=$PYTHON_HOME
    export LD_LIBRARY_PATH=$PYTHON_HOME/lib
    export PATH=$PYTHON_HOME/bin:$PATH
    python3 ${SETUP_PY} clean --all
    if [ -z ${folder_r} ];then
        LLVM_SYSPATH=${LLVM_SYSPATH_TEMP} \
        TRITON_BUILD_WITH_CCACHE=true \
        TRITON_BUILD_WITH_CLANG_LLD=true \
        TRITON_BUILD_PROTON=OFF \
        TRITON_WHEEL_NAME="triton_ascend" \
        TRITON_APPEND_CMAKE_ARGS="-DTRITON_BUILD_UT=OFF" \
        TRITON_REL_BUILD_WITH_ASSERTS=1 \
        TRITON_BUILD_TD=ON \
        IS_MANYLINUX=True \
        MAX_JOBS=48 \
        python3 ${SETUP_PY} bdist_wheel
    else
        TRITON_WHEEL_VERSION_SUFFIX="+dev${folder_r}"
        LLVM_SYSPATH=${LLVM_SYSPATH_TEMP} \
        TRITON_BUILD_WITH_CCACHE=true \
        TRITON_BUILD_WITH_CLANG_LLD=true \
        TRITON_BUILD_PROTON=OFF \
        TRITON_WHEEL_NAME="triton_ascend" \
        TRITON_APPEND_CMAKE_ARGS="-DTRITON_BUILD_UT=OFF" \
        TRITON_REL_BUILD_WITH_ASSERTS=1 \
        TRITON_WHEEL_VERSION_SUFFIX=${TRITON_WHEEL_VERSION_SUFFIX} \
        TRITON_BUILD_TD=ON \
        IS_MANYLINUX=True \
        MAX_JOBS=48 \
        python3 ${SETUP_PY} bdist_wheel
    fi
    ccache -s
}

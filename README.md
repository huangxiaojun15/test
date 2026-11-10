https://ci.openeuler.openatom.cn/job/multiarch/job/manual-jobs/job/openeuler/job/UBSCore/job/DT/job/ubs-io/configure
836ccad21e8a811858fd1543896ba2f1b932be52
https://gitcode.com/BeiMing_Dev/build_dependency

if [ $? -ne 0 ]; then
    echo "PR not found!"
    exit 1
fi
git merge --no-edit --allow-unrelated-histories pr_${prid}
cd ..
whoami

uname -a
cat /etc/os-release

sudo pip3 config set global.index-url https://repo.huaweicloud.com/repository/pypi/simple
sudo pip3 config set global.timeout 120

sudo yum install -y python3 
sudo yum install -y python3-pip
sudo yum install -y python3-devel
sudo yum install -y pybind11-devel 
sudo pip install wheel -i https://repo.huaweicloud.com/repository/pypi/simple --trusted-host repo.huaweicloud.com --timeout 120
sudo yum install -y gcc
sudo yum install -y gcc-c++
sudo yum install -y make
sudo yum install -y cmake
sudo yum install -y maven
sudo yum install -y hostname
sudo yum install -y fuse-devel
sudo yum install -y automake
sudo yum install -y librados-devel
sudo yum install -y libaio-devel
sudo yum install -y libtool
sudo yum install -y numactl-devel
sudo yum install -y libcurl-devel
sudo yum install -y libboundscheck
sudo yum install -y rdma-core-devel
sudo yum install -y openssl
sudo yum install -y openssl-devel
sudo yum install -y dos2unix
sudo yum install -y liburing
sudo yum install -y liburing-devel

sudo pip3 install pybind11 -i https://repo.huaweicloud.com/repository/pypi/simple --trusted-host repo.huaweicloud.com --timeout 120

find /usr -name "libssl.so*"

if [ "${tbranch}" == "develop" ];then
	cd ${WORKSPACE}/ubs-io/ubsio-kv/test/llt/
	sh run_dt.sh
fi

cd ${WORKSPACE}/ubs-io/ubsio-boostio/test/llt/
sh run_dt.sh

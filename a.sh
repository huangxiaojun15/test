#!/bin/bash
# ***********************************************************************
# Copyright: (c) Huawei Technologies Co., Ltd. 2021. All rights reserved.
# script for build
# version: 24.0.0
# change log:
# ***********************************************************************
set -e
CURRENT_DIR="$( cd "$( dirname "$0"  )" && pwd  )"
PROJECT_HOME="$( cd "$( dirname "$0" )"/.. && pwd  )"

ARCH=linux-x86_64
VERSION=24.0.0

CONFIG_PATH=${PROJECT_HOME}/config
PACKAGE_PATH=${PROJECT_HOME}/output/ock
LIB_PATH=${PACKAGE_PATH}/ucache/${VERSION}/${ARCH}/lib
UT_EXE_PATH=${PROJECT_HOME}/build/tests/it/bin

GENERATE_DIR=${CURRENT_DIR}/cov/gen
rm -rf ${CURRENT_DIR}/cov/; mkdir -p ${GENERATE_DIR}

sed -i 's/.*# mark gcov.*/set(GCOV_ENABLE "enable")/' ${PROJECT_HOME}/data-kit/CMakeLists.txt
cd ${PROJECT_HOME}/
dos2unix ${PROJECT_HOME}/build/*.sh

# need delete the output/ock without gcov first
if [ ! -d "${PROJECT_HOME}/output/ock/" ]; then
  sh build/build_ock.sh ut
  if [ 0 != $? ];then
    echo "Failed to build data kit"
      exit 1
  fi
fi

ip_port=$(ip a | grep inet|grep eth0|awk '{print $2}')
mkdir -p ${PROJECT_HOME}/output/ock/conf
cp -rf ${PROJECT_HOME}/tests/it/conf/* ${PROJECT_HOME}/output/ock/conf

if [ "${ip_port%/*}"1 != "7.197.80.210"1 ]
then
    sed -i "s/7.197.80.210/${ip_port%/*}/g" ${PROJECT_HOME}/output/ock/conf/ess/conf/ock.conf
    sed -i "s/7.197.80.210/${ip_port%/*}/g" ${PROJECT_HOME}/output/ock/conf/rss/conf/ock.conf
fi

mkdir -p ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common
mkdir -p ${PROJECT_HOME}/output/ock/ock_swap
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/rpc_hcom/lib/librpc_hcom.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/rpc_tcp/lib/librpc_tcp.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/rpc_secure/lib/libsecrpc.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/hcom/lib/libhcom.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/huawei_secure_c/lib/libsecurec.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/ulog/lib/*.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/expiration_check/lib/libexpire_checker.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/libevent/lib/libevent_openssl-2.1.so.7 ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/zk_helper/lib/libzk_helper.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/zookeeper/lib/libzookeeper_mt.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/zstar/lib/libzstar.so  ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/libevent/lib/libevent-2.1.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/libevent/lib/libevent_core-2.1.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/libevent/lib/libevent_extra-2.1.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/libevent/lib/libevent_pthreads-2.1.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cd ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
rm -rf libkmcjni.so
ln -s libkmcjni.so.23 libkmcjni.so
cp ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/libevent-2.1.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/libevent-2.1.so.7
cp ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/libevent_core-2.1.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/libevent_core-2.1.so.7
cp ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/libevent_extra-2.1.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/libevent_extra-2.1.so.7
cp ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/libevent_pthreads-2.1.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/libevent_pthreads-2.1.so.7
mkdir -p ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/openssl
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/openssl/lib/libssl.so.1.1 ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/openssl/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/openssl/lib/libssl.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/openssl/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/openssl/lib/libcrypto.so.1.1 ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/openssl/
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/openssl/lib/libcrypto.so.1.1 ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/openssl/libcrypto.so
cp -vf ${PROJECT_HOME}/output/ock-3rdparty/openssl_dl/lib/libopenssl_dl.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/common/
cd ${PROJECT_HOME}
gcc -fPIC -shared -o ${PROJECT_HOME}/tests/it/3rdpartysub/mfsub.so -I${PROJECT_HOME}/output/ock-3rdparty/mf/include ${PROJECT_HOME}/tests/it/3rdpartysub/mf_sub.c
cp -rf ${PROJECT_HOME}/tests/it/3rdpartysub/mfsub.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/mf/libbigmemory.so
cp -rf ${PROJECT_HOME}/tests/it/3rdpartysub/mfsub.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/mf/libbmclient.so
cp -rf ${PROJECT_HOME}/tests/it/3rdpartysub/mfsub.so ${PROJECT_HOME}/output/ock/ucache/${VERSION}/${ARCH}/lib/mf/libmemfabric.so
sh build/build_unit_test.sh
if [ 0 != $? ];then
  echo "Failed to build unit tests!"
    exit 1
fi

chmod 755 -R ${PACKAGE_PATH} ${UT_EXE_PATH}

source /etc/profile
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LIB_PATH}/datakit/:${LIB_PATH}/mf/:${LIB_PATH}/common/:${LIB_PATH}/common/ucx:${LIB_PATH}/common/ucx/ucx
export OCK_HOME=${PROJECT_HOME}/output/ock
export OCK_VERSION=24.0.0
export OCK_BINARY_TYPE=linux-x86_64
export CONFIG_PATH=${PROJECT_HOME}/output/ock/conf
export OCK_PATH=${PROJECT_HOME}/output/ock
$ZOOKEEPER_HOME/bin/zkServer.sh restart

find ${PROJECT_HOME}/build -type f -name "*.gcda" | xargs rm -rf

[ -d "${PROJECT_HOME}/build/res_xml" ] && rm -rf "${PROJECT_HOME}/build/res_xml"
mkdir -p "${PROJECT_HOME}/build/res_xml"

N_CPUS=$(grep processor /proc/cpuinfo | wc -l)
NUM=$((N_CPUS / 8))
IDX=0
cpu=()
if [[ $NUM -ge 1 ]]
then
    for ((i=1;i<=$NUM;i++))
    do
        cpu[${IDX}]="$((IDX * 8))-$((8 * i - 1))"
        IDX=$((IDX+1))
    done
else
    cpu[${IDX}]=0-$((N_CPUS - 1))
    IDX=$((IDX+1))
fi
CPUNUM=${IDX}
echo all: > makefile
IDX=0
for execute in $(ls -lsh ${UT_EXE_PATH}|awk '{print $1 " " $10}'|sort|awk '{print $2}')
do
    sed -i "s/all:/all: tag_${execute} /g" makefile
    echo tag_${execute}: ${UT_EXE_PATH}/${execute} >> makefile
    echo -e "\t taskset -c ${cpu[IDX]} ${UT_EXE_PATH}/${execute} --gtest_output=xml:${PROJECT_HOME}/build/res_xml/" >> makefile
    IDX=$((IDX+1))
    if [[ ${IDX} == ${CPUNUM} ]]
    then
        IDX=0
    fi
done
make all -j${CPUNUM}

$ZOOKEEPER_HOME/bin/zkServer.sh stop

echo all: > makefile
for i in "common" "cluster" "ucache/context" "ucache/message" "ucache/rpc" "ucache/sdk" "ucache/server"
do
    sed -i "s/all:/all: tag_${i##*/} /g" makefile
    echo "tag_${i##*/}: " >> makefile
    echo -e "\t sh ${PROJECT_HOME}/build/make_cov_info.sh ${i}" >> makefile
done
make all -j7

lcov -a ${GENERATE_DIR}/common/coverage.info -a ${GENERATE_DIR}/cluster/coverage.info -a ${GENERATE_DIR}/ucache/context/coverage.info -a ${GENERATE_DIR}/ucache/message/coverage.info -a ${GENERATE_DIR}/ucache/rpc/coverage.info -a ${GENERATE_DIR}/ucache/sdk/coverage.info -a ${GENERATE_DIR}/ucache/server/coverage.info -o ${GENERATE_DIR}/coverage.info --rc lcov_branch_coverage=1

genhtml -o ${GENERATE_DIR}/result ${GENERATE_DIR}/coverage.info --show-details --legend --rc lcov_branch_coverage=1
if [ 0 != $? ];then
  echo "Failed to generate all coverage info with html format"
  exit 1
fi

cd ${PROJECT_HOME}/build/
echo '<?xml version="1.0" encoding="UTF-8"?>' > test_detail.xml

tests_val=$(cat res_xml/* |grep "<testsuites "|awk -F "tests=" '{print $2}'|awk '{print $1}'|awk -F "\"" '{print $2}' | awk '{sum+=$1} END {print sum}')
failures_val=$(cat res_xml/* |grep "<testsuites "|awk -F "failures=" '{print $2}'|awk '{print $1}'|awk -F "\"" '{print $2}' | awk '{sum+=$1} END {print sum}')
disabled_val=$(cat res_xml/* |grep "<testsuites "|awk -F "disabled=" '{print $2}'|awk '{print $1}'|awk -F "\"" '{print $2}' | awk '{sum+=$1} END {print sum}')
errors_val=$(cat res_xml/* |grep "<testsuites "|awk -F "errors=" '{print $2}'|awk '{print $1}'|awk -F "\"" '{print $2}' | awk '{sum+=$1} END {print sum}')
time_val=$(cat res_xml/* |grep "<testsuites "|awk -F "time=" '{print $2}'|awk '{print $1}'|awk -F "\"" '{print $2}' | awk '{sum+=$1} END {print sum}')
timestamp_val=$(cat res_xml/* |grep "<testsuites "| head -n 1|awk -F "timestamp=" '{print $2}'|awk '{print $1}'|awk -F "\"" '{print $2}')

echo "<testsuites tests=\"${tests_val}\" failures=\"${failures_val}\" disabled=\"${disabled_val}\" errors=\"${errors_val}\" time=\"${time_val}\" timestamp=\"${timestamp_val}\" name=\"AllTests\">" >> test_detail.xml

cat res_xml/* | grep -v testsuites |grep -v "xml version" >> test_detail.xml

echo '</testsuites>' >> test_detail.xml
cp -rvf test_detail.xml ${GENERATE_DIR}/result/

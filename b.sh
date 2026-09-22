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

SUB_DIR=$1
GENERATE_DIR=${CURRENT_DIR}/cov/gen/${SUB_DIR}
rm -rf ${GENERATE_DIR}; mkdir -p ${GENERATE_DIR}

cd ${PROJECT_HOME}/build

#重复编译源文件到不同库中会导致覆盖率统计出错
for file in $(find ${PROJECT_HOME}/build/data-kit/${SUB_DIR} -name "*.gcda")
do
    cp -f $file ${GENERATE_DIR}
    cp -f ${file/\.gcda/\.gcno} ${GENERATE_DIR}
done
for file in $(find ${PROJECT_HOME}/build/tests/it/data-kit/${SUB_DIR} -name "*.gcda")
do
    cp -f $file ${GENERATE_DIR}
    cp -f ${file/\.gcda/\.gcno} ${GENERATE_DIR}
done

# generate all coverage
tmp_file="coverage_tmp.info"
lcov --d ${GENERATE_DIR} --c --output-file ${GENERATE_DIR}/${tmp_file} --exclude "/opt/*"  --exclude "/usr/include/*"  --exclude "*tests/it/*"  --exclude "*/3rdparty/*" --exclude "*/output/*" --rc lcov_branch_coverage=1
if [ 0 != $? ];then
  echo "Failed to generate all coverage info"
  exit 1
fi

# remove other info

lcov -r ${GENERATE_DIR}/${tmp_file} "*_generated.h" -o ${GENERATE_DIR}/coverage.info --rc lcov_branch_coverage=1
if [ 0 != $? ];then
  echo "Failed to remove *_generated.h from coverage info"
  exit 1
fi

#genhtml -o ${GENERATE_DIR}/result ${GENERATE_DIR}/${tmp_file} --show-details --legend
#if [ 0 != $? ];then
#  echo "Failed to generate all coverage info with html format"
#  exit 1
#fi

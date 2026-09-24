bash build.sh --pkg --ops="kv_quant_sparse_attn_sharedkv_v2;kv_quant_sparse_attn_sharedkv_v2_metadata" --soc="ascend950"


mkdir -p build && cd build

cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DSOC_VERSION=$SOC_VERSION \
  -DASCEND_HOME_PATH=$ASCEND_HOME_PATH \
  -DPYTHON_EXECUTABLE=$(which python3) \
  -DPYTHON_INCLUDE_PATH=$(python3 -c "import sysconfig; print(sysconfig.get_path('include'))") \
  -DTORCH_NPU_PATH=$(python3 -c "import torch_npu; print(torch_npu.__path__[0])") \
  -DCMAKE_PREFIX_PATH=$(python3 -c "import pybind11; print(pybind11.get_cmake_dir())") \
  -DFETCHCONTENT_BASE_DIR=$(pwd)/../.deps

make -j$(nproc)


cd /path/to/vllm-ascend/csrc

# 只编译这两个算子（--soc 用 ascend910b 或 ascend910_93）
bash build.sh --pkg --ops="sparse_attn_sharedkv;sparse_attn_sharedkv_metadata" --soc="ascend910b"


./build/cann-ops-transformer*.run --install-path=$(pwd)/../vllm_ascend/_cann_ops_custom

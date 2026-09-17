source /usr/local/Ascend/ascend-toolkit/set_env.sh
source /usr/local/Ascend/nnal/atb/set_env.sh
source /usr/local/Ascend/ascend-toolkit/latest/opp/vendors/customize/bin/set_env.bash
source /usr/local/Ascend/ascend-toolkit/latest/opp/vendors/custom_transformer/bin/set_env.bash

1. pip install memfabric_hybrid-1.2.1-cp312-cp312-manylinux_2_26_aarch64.manylinux_2_28_aarch64.whl --force-reinstall
2. mfcli kernel install
3. pip install memcache_hybrid-1.2.1-cp312-cp312-manylinux_2_26_aarch64.manylinux_2_28_aarch64.whl --force-reinstall

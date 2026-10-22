https://gitcode.com/lisong_hw/ubs-engine/tree/ut-fix-mockcpp
https://124.70.105.69:51001/jenkins/job/BeiMingTest/job/daily_test/job/Deploy_Test_ubs_mem/29/consoleFull
bash csrc/build_batch_invariant_ops.sh ascend950
https://github.com/Ascend/cann-container-image/blob/main/cann/9.1.0-910-ubuntu22.04-py3.12/Dockerfile
https://ci.openeuler.openatom.cn/job/multiarch/job/manual-jobs/job/openeuler/job/UBSCore


NPU_SMI_BIN="$(command -v npu-smi)"
echo "$NPU_SMI_BIN"
ldd "$NPU_SMI_BIN"

find /usr/local /usr/lib64 /lib64 \
  -name 'liburma.so*' -ls 2>/dev/null

ldconfig -p | grep -E 'urma|dcmi'

https://gitcode.com/lisong_hw/ubs-engine/tree/ut-fix-mockcpp
https://124.70.105.69:51001/jenkins/job/BeiMingTest/job/daily_test/job/Deploy_Test_ubs_mem/29/consoleFull
bash csrc/build_batch_invariant_ops.sh ascend950
https://github.com/Ascend/cann-container-image/blob/main/cann/9.1.0-910-ubuntu22.04-py3.12/Dockerfile
https://ci.openeuler.openatom.cn/job/multiarch/job/manual-jobs/job/openeuler/job/UBSCore


(base) [root@localhost ~]# docker exec -it fb5eaa0f7038634c385c33dd7ba9e21da608342d82642fc133d676173d67cdc8 bash
root@localhost:/workspace# NPU_SMI_BIN="$(command -v npu-smi)" echo "$NPU_SMI_BIN" ldd "$NPU_SMI_BIN"
 ldd 
root@localhost:/workspace# find /usr/local /usr/lib64 /lib64 -name 'liburma.so*' -ls 2>/dev/null
133434300    260 -rwxr-xr-x   1 root     root       264576 Sep 28 04:53 /usr/lib64/liburma.so.0.0.3
133439729      0 lrwxrwxrwx   1 root     root           12 Sep 28 04:53 /usr/lib64/liburma.so -> liburma.so.0
133434299      0 lrwxrwxrwx   1 root     root           16 Sep 28 04:53 /usr/lib64/liburma.so.0 -> liburma.so.0.0.3
133434300    260 -rwxr-xr-x   1 root     root       264576 Sep 28 04:53 /lib64/liburma.so.0.0.3
133439729      0 lrwxrwxrwx   1 root     root           12 Sep 28 04:53 /lib64/liburma.so -> liburma.so.0
133434299      0 lrwxrwxrwx   1 root     root           16 Sep 28 04:53 /lib64/liburma.so.0 -> liburma.so.0.0.3
root@localhost:/workspace# 
root@localhost:/workspace# 
root@localhost:/workspace# ldconfig -p | grep -E 'urma|dcmi'
root@localhost:/workspace# 


https://gitcode.com/lisong_hw/ubs-engine/tree/ut-fix-mockcpp
https://124.70.105.69:51001/jenkins/job/BeiMingTest/job/daily_test/job/Deploy_Test_ubs_mem/29/consoleFull
bash csrc/build_batch_invariant_ops.sh ascend950
https://github.com/Ascend/cann-container-image/blob/main/cann/9.1.0-910-ubuntu22.04-py3.12/Dockerfile
https://ci.openeuler.openatom.cn/job/multiarch/job/manual-jobs/job/openeuler/job/UBSCore

ae935b0f5215458f9a763bb8c2e74c24

(base) [root@localhost ~]# name=sglang-cann
(base) [root@localhost ~]# image=swr.cn-southwest-2.myhuaweicloud.com/base_image/dockerhub/lmsysorg/sglang:nightly-cann9.2.0-950
(base) [root@localhost ~]# name=$1
(base) [root@localhost ~]# name=$1
(base) [root@localhost ~]# image=$2
(base) [root@localhost ~]# docker run --runtime=runc -u root -it -d --name ${name} --net=host --privileged=true --shm-size=2g \
    --device=/dev/davinci_manager --device=/dev/hisi_hdc --device=/dev/ummu --device=/dev/uburma \
    --device=/dev/davinci0 \
    --device=/dev/davinci1 \
    --device=/dev/davinci2 \
    --device=/dev/davinci3 \
    --device=/dev/davinci4 \
    --device=/dev/davinci5 \
    --device=/dev/davinci6 \
    --device=/dev/davinci7 \
    -v /usr/local/Ascend/driver:/usr/local/Ascend/driver \
    -v /usr/local/Ascend/firmware:/usr/local/Ascend/firmware \
    -v /root/host:/root/host  \
    -v /usr/local/sbin/npu-smi:/usr/local/sbin/npu-smi \
    -v /usr/local/sbin:/usr/local/sbin \
    -v /usr/local/dcmi:/usr/local/dcmi \
    -v /var/log/npu/:/usr/slog \
    -v /mnt:/mnt \
    -v /data:/data \
    -v /lib64:/lib64:ro \
    -v /usr/lib64:/usr/lib64   \
    -v /usr/local/bin/npu-smi:/usr/local/bin/npu-smi \
    -v /usr/local/sbin/npu-smi:/usr/local/sbin/npu-smi \
    -v /home/:/home/ \
    -v /etc/hixlep:/etc/hixlep \
    -w /workspace \
    $image \
    bash
Unable to find image 'bash:latest' locally
docker: Error response from daemon: Get "https://registry-1.docker.io/v2/": proxyconnect tcp: dial tcp 141.3.137.13:8080: connect: connection refused.
See 'docker run --help'.
(base) [root@localhost ~]# name=sglang-cann
(base) [root@localhost ~]# image=swr.cn-southwest-2.myhuaweicloud.com/base_image/dockerhub/lmsysorg/sglang:nightly-cann9.2.0-950
(base) [root@localhost ~]# docker run --runtime=runc -u root -it -d --name ${name} --net=host --privileged=true --shm-size=2g     --device=/dev/davinci_manager --device=/dev/hisi_hdc --device=/dev/ummu --device=/dev/uburma     --device=/dev/davinci0     --device=/dev/davinci1     --device=/dev/davinci2     --device=/dev/davinci3     --device=/dev/davinci4     --device=/dev/davinci5     --device=/dev/davinci6     --device=/dev/davinci7     -v /usr/local/Ascend/driver:/usr/local/Ascend/driver     -v /usr/local/Ascend/firmware:/usr/local/Ascend/firmware     -v /root/host:/root/host      -v /usr/local/sbin/npu-smi:/usr/local/sbin/npu-smi     -v /usr/local/sbin:/usr/local/sbin     -v /usr/local/dcmi:/usr/local/dcmi     -v /var/log/npu/:/usr/slog     -v /mnt:/mnt     -v /data:/data     -v /lib64:/lib64:ro     -v /usr/lib64:/usr/lib64       -v /usr/local/bin/npu-smi:/usr/local/bin/npu-smi     -v /usr/local/sbin/npu-smi:/usr/local/sbin/npu-smi     -v /home/:/home/     -v /etc/hixlep:/etc/hixlep     -w /workspace     $image     bash
fb5eaa0f7038634c385c33dd7ba9e21da608342d82642fc133d676173d67cdc8
(base) [root@localhost ~]# 
(base) [root@localhost ~]# 
(base) [root@localhost ~]# docker exec -it “$name” bash
Error: No such container: “sglang-cann”
(base) [root@localhost ~]# docker exec -it fb5eaa0f7038634c385c33dd7ba9e21da608342d82642fc133d676173d67cdc8 bash
root@localhost:/workspace# 
root@localhost:/workspace# 
root@localhost:/workspace# npu-smi info
npu-smi: error while loading shared libraries: liburma.so.0: cannot open shared object file: No such file or directory


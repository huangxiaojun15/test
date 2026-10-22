https://gitcode.com/lisong_hw/ubs-engine/tree/ut-fix-mockcpp
https://124.70.105.69:51001/jenkins/job/BeiMingTest/job/daily_test/job/Deploy_Test_ubs_mem/29/consoleFull
bash csrc/build_batch_invariant_ops.sh ascend950
https://github.com/Ascend/cann-container-image/blob/main/cann/9.1.0-910-ubuntu22.04-py3.12/Dockerfile
https://ci.openeuler.openatom.cn/job/multiarch/job/manual-jobs/job/openeuler/job/UBSCore

ae935b0f5215458f9a763bb8c2e74c24

name=$1
image=$2

docker run --runtime=runc -u root -it -d --name ${name} --net=host --privileged=true --shm-size=2g \
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

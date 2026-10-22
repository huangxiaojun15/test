IMAGE="swr.cn-southwest-2.myhuaweicloud.com/base_image/dockerhub/lmsysorg/sglang:nightly-cann9.2.0-950"

docker run \
    --runtime=runc \
    -u root \
    -it -d \
    --name sglang-hxj \
    --net=host \
    --privileged=true \
    --shm-size=2g \
    --device=/dev/davinci_manager \
    --device=/dev/hisi_hdc \
    --device=/dev/ummu \
    --device=/dev/uburma \
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
    -v /usr/local/dcmi:/usr/local/dcmi \
    -v /usr/local/bin/npu-smi:/usr/local/bin/npu-smi:ro \
    -v /etc/ascend_install.info:/etc/ascend_install.info:ro \
    -v /opt/sglang-ub-libs:/opt/sglang-ub-libs:ro \
    -v /var/log/npu:/usr/slog \
    -v /root/host:/root/host \
    -v /mnt:/mnt \
    -v /data:/data \
    -v /home:/home \
    -v /etc/hccl_rootinfo.json:/etc/hccl_rootinfo.json:ro \
    -v /etc/hixlep:/etc/hixlep:ro \
    -v /usr/lib64/liburma.so.0:/usr/local/lib/liburma.so.0 \
    -v /usr/lib64/libummu.so.1:/usr/local/lib/libummu.so.1 \
    -v /usr/lib64/liburma.so.0:/usr/local/lib/liburma.so.0 \
     -v /usr/lib64/liburma_common.so.0:/usr/local/lib/liburma_common.so.0 \
    -w /workspace \
    --entrypoint /bin/bash \
    "$IMAGE" -c 'exec sleep infinity


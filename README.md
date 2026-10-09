https://www.openlibing.com/apps/entryCheckNew?projectId=300130
[root@localhost y30082119]# docker run -itd --privileged --network=host --shm-size=16g \
> --name sgl-yzy-cann9.1 \
> -v /mnt:/mnt \
> -v /home:/home \
> -v /data:/data \
> -v /usr/local/sbin:/usr/local/sbin \
> -v /usr/local/Ascend/driver:/usr/local/Ascend/driver \
> -v /usr/local/Ascend/firmware:/usr/local/Ascend/firmware \
> -v /etc/ascend_install.info:/etc/ascend_install.info \
> -v /etc/hccl_rootinfo.json:/etc/hccl_rootinfo.json \
> -v /var/queue_scheduler:/var/queue_scheduler \
> -v /lib64:/lib64 \
> -v /usr/lib64:/usr/lib64 \
> --device=/dev/davinci0 \
> --device=/dev/davinci1 \
> --device=/dev/davinci2 \
> --device=/dev/davinci3 \
> --device=/dev/davinci4 \
> --device=/dev/davinci5 \
> --device=/dev/davinci6 \
> --device=/dev/davinci7 \
> --device=/dev/davinci8 \
> --device=/dev/davinci9 \
> --device=/dev/davinci10 \
> --device=/dev/davinci11 \
> --device=/dev/davinci12 \
> --device=/dev/davinci13 \
> --device=/dev/davinci14 \
> --device=/dev/davinci15 \
> --device=/dev/davinci_manager \
> --device=/dev/hisi_hdc \
> --entrypoint=bash \
> --env HF_ENDPOINT=https://hf-mirror.com \
> swr.cn-southwest-2.myhuaweicloud.com/base_image/dockerhub/lmsysorg/sglang:cann9.1.0-950-B081
00d56aff1103fbf64369490521db623e142b95a97fc900a10c4e10070e43d115
[root@localhost y30082119]# docker ps
CONTAINER ID   IMAGE                                                                                              COMMAND                  CREATED          STATUS          PORTS     NAMES
ce66ffb3488c   204b9702b683                                                                                       "/bin/bash -c '    s…"   26 minutes ago   Up 26 minutes             vibrant_kirch
bd8a75db9eed   dd845c480ba6                                                                                       "bash"                   19 hours ago     Up 19 hours               comm_test
0fe5564088c5   swr.cn-southwest-2.myhuaweicloud.com/base_image/dockerhub/lmsysorg/sglang:cann9.1.0-950-B081       "bash"                   23 hours ago     Up 23 hours               lph-1008
c0071bc74e28   swr.cn-southwest-2.myhuaweicloud.com/base_image/dockerhub/lmsysorg/sglang:cann9.1.0-950-B081       "bash"                   23 hours ago     Up 23 hours               sjs_sgl
cde74b5ba104   dd845c480ba6                                                                                       "/bin/bash -c '    s…"   46 hours ago     Up 23 hours               glm2_sglang
ad04838a0cab   swr.cn-southwest-2.myhuaweicloud.com/base_image/dockerhub/lmsysorg/sglang:cann9.1.0-950-B081       "/bin/bash"              3 days ago       Up 4 hours                wst_sgl_b81
f23a276038d1   dd845c480ba6                                                                                       "/bin/bash -c '    s…"   9 days ago       Up 21 hours               asavkin
fb0ed3755433   dd845c480ba6                                                                                       "bash"                   2 weeks ago      Up 19 hours               tbay_sglang
23503631a630   e500892c02df                                                                                       "bash"                   3 weeks ago      Up 16 hours               b00920894_sglang
8696d529d01a   swr.cn-southwest-2.myhuaweicloud.com/base_image/dockerhub/lmsysorg/sglang:cann9.1.0-950-20260818   "bash"                   6 weeks ago      Up 27 hours               zyl-sgl

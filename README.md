root@localhost:/workspace# npu-smi info
npu-smi: error while loading shared libraries: liburma.so.0: cannot open shared object file: No such file or directory


https://github.com/Ascend/cann-container-image/blob/main/cann/9.2.0-950-ubuntu22.04-py3.12/Dockerfile

https://github.com/LH-123L/triton-ascend/tree/main_docker


docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-a3-openeuler24.03-py3.11
docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-950-debian12-py3.11
docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-910b-openeuler24.03-py3.11
docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-950-ubuntu24.04-py3.11
docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-910b-debian12-py3.11
docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-910b-ubuntu24.04-py3.11
docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-a3-debian12-py3.11
docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-950-openeuler24.03-py3.11
docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-a3-ubuntu24.04-py3.11


docker buildx build \
  --platform linux/arm64 \
  --network host \
  --build-arg BASE_IMAGE=ubuntu:22.04 \
  --build-arg DEVICE_TYPE=a3 \
  --build-arg CANN_VERSION=9.2.0 \
  --build-arg PYTHON_VERSION=3.11.15 \
  --build-arg PYTHON_SERIES=3.11 \
  --build-arg PYTORCH_VERSION=2.10.0 \
  --build-arg TORCH_NPU_VERSION=2.10.0.post7 \
  --build-arg TRITON_ASCEND_VERSION=3.6.0 \
  -f docker/cann9.2.0_npu.Dockerfile \
  -t triton:3.6.0-cann9.2.0-torch_npu2.10.0.post7-a3-ubuntu22.04-py3.11-aarch64 \
  --load \
  .

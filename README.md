MemoryFabric 自动编译了 cann-hybm-compat.tar.gz这个软件包但是没有有效签名，编译的时候报错了
source /usr/local/Ascend/ascend-toolkit/latest/opp/vendors/customize/bin/set_env.bash
source /usr/local/Ascend/ascend-toolkit/latest/opp/vendors/custom_transformer/bin/set_env.bash
source /usr/local/Ascend/ascend-toolkit/latest/set_env.sh
source /usr/local/Ascend/nnal/atb/set_env.sh


石荆山
[图片]
MemoryFabric 自动编译了 cann-hybm-compat.tar.gz这个软件包但是没有有效签名，编译的时候报错了
当前导入MemoryFabric包后会自动编译并注册未签名的 cann-hybm-compat.tar.gz，设备开启签名校验后，在 torch.npu.set_device() 阶段报 E30009 Package_Error_Verify_Package，导致 TsdOpen failed。在移除了这个包并恢复 ascend_package_load.ini 后 NPU 才可以恢复。现在A5适配PD分离场景需要提供同版本已签名的 HYBM AICPU 包，或提供官方支持的签名安装方案/完整镜像
https://github.com/Ascend/sglang/blob/gh-pages/docker/npu2-a3.Dockerfile

https://github.com/Ascend/sglang/actions/runs/31708966118


docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-a3-ubuntu24.04-py3.11

docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-910b-ubuntu24.04-py3.11

docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-950-ubuntu24.04-py3.11

docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-950-debian12-py3.11

docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-a3-openeuler24.03-py3.11

docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-a3-debian12-py3.11

docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-910b-openeuler24.03-py3.11

docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-910b-debian12-py3.11

docker pull swr.cn-north-4.myhuaweicloud.com/opentile/triton:3.2.2-cann9.1.0-torch_npu2.7.1.post8-950-openeuler24.03-py3.11


https://triton-ascend-artifacts.obs.myhuaweicloud.com/llvm-builds/llvm-f6ded0be-4ca23101-ubuntu-x64.tar.gz
https://triton-ascend-artifacts.obs.myhuaweicloud.com/llvm-builds/llvm-f6ded0be-4ca23101-ubuntu-arm64.tar.gz

swr.cn-north-4.myhuaweicloud.com/hw-ascend/manylinux_2_28_x86:latest  
swr.cn-north-4.myhuaweicloud.com/hw-ascend/triton_manylinux_2_28_arm:v2.0

1、安装 llvm
2、安装python的so库。环境上已安装python，但无对应so库

3、安装cann

cann_9.1.0-beta.1

https://triton-ascend-artifacts.obs.myhuaweicloud.com/llvm-builds/llvm-f6ded0be-4ca23101-ubuntu-x64.tar.gz
https://triton-ascend-artifacts.obs.myhuaweicloud.com/llvm-builds/llvm-f6ded0be-4ca23101-ubuntu-arm64.tar.gz



https://applink.feishu.cn/client/chat/chatter/add_by_link?link_token=6ebn9590-1b02-4db3-acb1-b0603037d603
账号申请表：
https://acnzfe9bkhyg.feishu.cn/share/base/form/shrcnfyAx2jT3ZahGwWai0N6Xtc

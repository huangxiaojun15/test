MemoryFabric 自动编译了 cann-hybm-compat.tar.gz这个软件包但是没有有效签名，编译的时候报错了
source /usr/local/Ascend/ascend-toolkit/latest/opp/vendors/customize/bin/set_env.bash
source /usr/local/Ascend/ascend-toolkit/latest/opp/vendors/custom_transformer/bin/set_env.bash
source /usr/local/Ascend/ascend-toolkit/latest/set_env.sh
source /usr/local/Ascend/nnal/atb/set_env.sh


石荆山
[图片]
MemoryFabric 自动编译了 cann-hybm-compat.tar.gz这个软件包但是没有有效签名，编译的时候报错了
当前导入MemoryFabric包后会自动编译并注册未签名的 cann-hybm-compat.tar.gz，设备开启签名校验后，在 torch.npu.set_device() 阶段报 E30009 Package_Error_Verify_Package，导致 TsdOpen failed。在移除了这个包并恢复 ascend_package_load.ini 后 NPU 才可以恢复。现在A5适配PD分离场景需要提供同版本已签名的 HYBM AICPU 包，或提供官方支持的签名安装方案/完整镜像

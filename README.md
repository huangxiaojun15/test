 基于cann9.1 A5 dockerfile
1、sglang代码：
2、mf编译安装：
https://gitcode.com/victor7wang/memfabric_hybrid/tree/br_v4.1_a5 
bash script/build.sh
./memfabric_hybrid-1.2.1_linux_aarch64.run --install
source /usr/local/memfabric_hybrid/set_env.sh
3、custom ops安装：
wget https://sglang-ascend.obs.cn-east-3.myhuaweicloud.com:443/dsv41/cann-ops-transformer-custom_linux-aarch64.run?AccessKeyId=HPUAXT4YM0U8JNTERLST&Expires=1789680150&Signature=nIu2UpZryzkP4VVHxl6sWWHiTq8%3D
安装run包
4、tilelang包安装：
https://sglang-ascend.obs.cn-east-3.myhuaweicloud.com:443/dsv41/tilelang-0.1.2%2Bubuntu.22.4.npuir-cp312-cp312-linux_aarch64.whl?AccessKeyId=HPUAXT4YM0U8JNTERLST&Expires=1789681639&Signature=n/bGuUSIGPa7OGPpkRS%2B54h3lfA%3D
pip install xx


软文内容：
sglang + engram offload + Triton + tilelang


https://github.com/sgl-project/sglang/pull/38950
雷学伟 00502295 2026-09-11 06:11
张春立
https://github.com/sgl-project/sglang/pull/38950
sgl代码地址

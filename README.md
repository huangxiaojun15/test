https://obs-memfabric-hybrid.obs.cn-north-4.myhuaweicloud.com/memcache/mc_version.json
https://obs-memfabric-hybrid.obs.cn-north-4.myhuaweicloud.com/mf/mf_version.json


https://repo.openeuler.org/openEuler-24.03-LTS-SP3/ISO/aarch64/
https://sglang-npu.obs.cn-southwest-2.myhuaweicloud.com:443/Triton-ascend/3.2.2/triton_ascend-3.2.2-cp312-cp312-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl?AccessKeyId=HPUAAPJN7IAXFCS2GDSQ&Expires=1806290330&Signature=eRq3VKjwgP/tTkObtsho%2BzIsmJM%3D
https://ascend-triton-open.obs.cn-north-4.myhuaweicloud.com/triton-ascend/20260929220210/triton_ascend-3.6.0+dev20260929220210-cp312-cp312-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
https://github.com/sgl-project/sglang/actions/runs/37650156427
https://github.com/sgl-project/sglang/actions/runs/37493822066


function conf_triton_ascend_code()
{
    local  npuir_path_r="$1"
    local  triton_ascend_path_r="$2"
    local  arch_r="$3"
    mkdir -p "${npuir_path_r}"
    cd "${npuir_path_r}"
    npuir_url="https://ascend-cann-open.obs.cn-north-4.myhuaweicloud.com/Triton_Innersource/npu-ir/version/npu-ir-latest/ascendnpu-ir_2.0.0_linux-${arch_r}.tar.gz"
    rm -f ascendnpu-ir_2.0.0_linux-${arch_r}.tar.gz
    curl -L -o ascendnpu-ir_2.0.0_linux-${arch_r}.tar.gz $npuir_url
    mkdir npuir
    tar -zxvf ascendnpu-ir_2.0.0_linux-${arch_r}.tar.gz -C npuir
    cp -r ./npuir/ "${triton_ascend_path_r}"/third_party/ascend/backend/bishengir/
}
https://sglang-npu.obs.cn-southwest-2.myhuaweicloud.com/Triton-ascend/3.2.2/triton_ascend-3.2.2-cp312-cp312-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
https://github.com/sgl-project/sglang/actions/runs/37763674480/job/113266013690

不行，还是报没有triton


https://obs-memfabric-hybrid.obs.cn-north-4.myhuaweicloud.com/memcache/mc_version.json
https://obs-memfabric-hybrid.obs.cn-north-4.myhuaweicloud.com/mf/mf_version.json

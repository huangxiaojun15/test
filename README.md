{"sources":[{"type":"code","params":{"git_type":"codehub","codehub_id":"2638244","default_branch":"master","git_url":"https://codehub.devcloud.cn-north-4.huaweicloud.com/1e20b309fcb34b00a0043a87e461c95a/ci.git","alias":"","endpoint_id":"","build_params":{"build_type":"branch","event_type":"Manual","target_branch":"master","tag":null,"commit_id":null}}}],"description":"","variables":[{"name":"a3_branch","sequence":1,"type":"string","is_strict":false,"value":"master","is_secret":false,"description":"","is_runtime":true,"limits":[],"is_reset":false,"latest_value":""},{"name":"a5_branch","sequence":2,"type":"string","is_strict":false,"value":"feature/regbase","is_secret":false,"description":"","is_runtime":true,"limits":[],"is_reset":false,"latest_value":""},{"name":"B_SUFFIX","sequence":3,"type":"string","is_strict":false,"value":"9.1.0.B090","is_secret":false,"description":"","is_runtime":true,"limits":[],"is_reset":false,"latest_value":""}],"choose_jobs":["JOB_KrFWZ","JOB_tJpGz"],"choose_stages":["1775895022697812edcf3-c260-4a4e-a6f8-519728d9a88c"],"execution_plan_id":""}

{
 "sources": [
  {
   "type": "code",
   "params": {
    "git_type": "codehub",
    "codehub_id": "2638244",
    "default_branch": "master",
    "git_url": "https://codehub.devcloud.cn-north-4.huaweicloud.com/1e20b309fcb34b00a0043a87e461c95a/ci.git",
    "alias": "",
    "endpoint_id": "",
    "build_params": {
     "build_type": "branch",
     "event_type": "Manual",
     "target_branch": "master",
     "tag": null,
     "commit_id": null
    }
   }
  }
 ],
 "description": "",
 "variables": [
  {
   "name": "a3_branch",
   "sequence": 1,
   "type": "string",
   "is_strict": false,
   "value": "master",
   "is_secret": false,
   "description": "",
   "is_runtime": true,
   "limits": [],
   "is_reset": false,
   "latest_value": ""
  },
  {
   "name": "a5_branch",
   "sequence": 2,
   "type": "string",
   "is_strict": false,
   "value": "feature/regbase",
   "is_secret": false,
   "description": "",
   "is_runtime": true,
   "limits": [],
   "is_reset": false,
   "latest_value": ""
  },
  {
   "name": "B_SUFFIX",
   "sequence": 3,
   "type": "string",
   "is_strict": false,
   "value": "9.1.0.B090",
   "is_secret": false,
   "description": "",
   "is_runtime": true,
   "limits": [],
   "is_reset": false,
   "latest_value": ""
  }
 ],
 "choose_jobs": [
  "JOB_KrFWZ",
  "JOB_tJpGz"
 ],
 "choose_stages": [
  "1775895022697812edcf3-c260-4a4e-a6f8-519728d9a88c"
 ],
 "execution_plan_id": ""
}

  base-c-test-acc-4-npu-a3:
    name: base-c-test-acc-4-npu-a3
    needs: [ check-changes, pr-gate, set-image-config ]
    if: ${{ !failure() && !cancelled() && needs.check-changes.outputs.main_package == 'true' }}
    uses: ./.github/workflows/_npu-single-node-test-stage.yml
    with:
      runner: linux-aarch64-a3-4-
      test_type: 'accuracy'
      test_suite: base-c-test-acc-4-npu-a3
      image: ${{ needs.set-image-config.outputs.CANN_image_a3 }}
      install_sglang_deps: true
      device_type_for_deps: 'a3'

https://gitcode.com/Ascend/pytorch/releases/download/v26.1.0-pytorch2.10.0/torch_npu-2.10.0.post4-cp312-cp312-manylinux_2_28_$arch.whl

npu_hc_post\inplace_partial_rotary_mul\compressor\indexer_compress_epilog\npu_quant_lightning_indexer_metadata\npu_quant_lightning_indexer\npu_kv_quant_sparse_attn_sharedkv_metadata\npu_kv_quant_sparse_attn_sharedkv\npu_moe_gating_top_k

Download
# Create a folder
$ mkdir actions-runner && cd actions-runner# Download the latest runner package
$ curl -o actions-runner-linux-x64-2.338.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.338.2/actions-runner-linux-x64-2.338.2.tar.gz# Optional: Validate the hash
$ echo "baebf204307bac6193480852732f0aba2ae97b6c5597c244f4d5558390147c40  actions-runner-linux-x64-2.338.2.tar.gz" | shasum -a 256 -c# Extract the installer
$ tar xzf ./actions-runner-linux-x64-2.338.2.tar.gz
Configure
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/sgl-project/sgl-kernel-npu --token ADNUA6CGSSH5E2GCD4P2BODK63FXO# Last step, run it!
$ ./run.sh
Using your self-hosted runner
# Use this YAML in your workflow file for each job
runs-on: self-hosted
x86
Download
# Create a folder
$ mkdir actions-runner && cd actions-runner# Download the latest runner package
$ curl -o actions-runner-linux-arm64-2.338.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.338.2/actions-runner-linux-arm64-2.338.2.tar.gz# Optional: Validate the hash
$ echo "670adb2f268fe21dcbb58b3db0e0aa9d5b3bddfe2c651481336e561ff86de945  actions-runner-linux-arm64-2.338.2.tar.gz" | shasum -a 256 -c# Extract the installer
$ tar xzf ./actions-runner-linux-arm64-2.338.2.tar.gz
Configure
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/sgl-project/sgl-kernel-npu --token ADNUA6CGSSH5E2GCD4P2BODK63FXO# Last step, run it!
$ ./run.sh
Using your self-hosted runner
# Use this YAML in your workflow file for each job
runs-on: self-hosted
WF6ebeq1rbe+pC4PD%ecJpI/
./config.sh --url https://github.com/sgl-project/sgl-kernel-npu --token ADNUA6ENMG7BCTQI4RYYMUDK63VUG
	
root@0128bf138062:/# find /usr/local/Ascend -iname "libascend_hal.so" -print
/usr/local/Ascend/cann-9.2.0/x86_64-linux/simulator/dav_3510/camodel/libascend_hal.so
/usr/local/Ascend/cann-9.2.0/x86_64-linux/lib64/device/lib64/libascend_hal.so
/usr/local/Ascend/cann-9.2.0/x86_64-linux/devlib/linux/x86_64/libascend_hal.so
/usr/local/Ascend/cann-9.2.0/x86_64-linux/devlib/linux/aarch64/libascend_hal.so
/usr/local/Ascend/cann-9.2.0/x86_64-linux/devlib/device/libascend_hal.so
/usr/local/Ascend/cann-9.2.0/x86_64-linux/devlib/libascend_hal.so


pip install memfabric-hybrid==1.5.0.dev20261119 --trusted-host ascend.devcloud.huaweicloud.com -i https://ascend.devcloud.huaweicloud.com/pypi/simple
swr.cn-southwest-2.myhuaweicloud.com/base_image/ascend-ci/cann/cann

pip install memfabric-hybrid==1.5.0.dev20261123 -i https://mirrors.huaweicloud.com/ascend/repos/pypi/nightly/
https://ascend.devcloud.huaweicloud.com/artifactory/ascend-pypi/nightly/memfabric-hybrid/

https://github.com/sgl-project/sglang/actions/runs/45542499978/job/138966232133?pr=51818

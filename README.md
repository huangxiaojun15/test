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
ecs-for-sglang-ci-arm-0004	172.16.0.145					
ecs-for-sglang-ci-arm-0002	172.16.0.100					
ecs-for-sglang-ci-arm-0001	172.16.0.113					
ecs-for-sglang-ci-arm-0003	172.16.0.162					
ecs-for-sglang-ci-arm-0005	172.16.0.177					
ecs-for-sglang-ci-0001	172.16.0.135	101.44.96.123:30135	root	WF6ebeq1rbe+pC4PD%ecJpI/		
ecs-for-sglang-ci-0004	172.16.0.172					
ecs-for-sglang-ci-0003	172.16.0.4					
ecs-for-sglang-ci-0002	172.16.0.229		

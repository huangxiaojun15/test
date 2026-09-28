[2026/09/28 11:01:32.394 GMT+08:00] [INFO] [BUILD:wait_job_depends] : This step is start
[2026/09/28 11:01:32.400 GMT+08:00] [INFO] [BUILD:wait_job_depends] : plugin version is :1.1.9
[2026/09/28 11:01:32.430 GMT+08:00] [INFO] [BUILD:wait_job_depends] : No dependent build jobs!
[2026/09/28 11:01:32.430 GMT+08:00] [INFO] [BUILD:wait_job_depends] : This step is complete
[2026/09/28 11:01:32.460 GMT+08:00] [INFO] [BUILD:build_execute] : This step is start
[2026/09/28 11:01:32.468 GMT+08:00] [INFO] [BUILD:build_execute] : plugin version is :1.3.11.28
[2026/09/28 11:01:32.468 GMT+08:00] [INFO] [BUILD:build_execute] : input json :{"isCheck":false,"next3rd":false,"scmRelativeTargetDir":"build_project","language":"zh-cn","script":"today_Timestamp=$(date +%Y%m)\nhisi_Timestamp=$(curl \"http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}?op=LISTSTATUS&user.name=hadoop\" | grep -Eo \"[0-9]{8}_[0-9]{9}_newest\" | grep $(date +%Y%m%d)_00 | tail -n1)\necho \"[INFO]: hisi_Timestamp is ${hisi_Timestamp}\"\naarch_package_name=$(curl \"http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}/${hisi_Timestamp}?op=LISTSTATUS&user.name=hadoop\" | grep -oE \"cann-bisheng-compiler_[^-]*_linux-aarch64\\.run\" | tail -n1)\nx86_package_name=$(curl \"http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}/${hisi_Timestamp}?op=LISTSTATUS&user.name=hadoop\" | grep -oE \"cann-bisheng-compiler_[^-]*_linux-x86_64\\.run\" | tail -n1)\nif [ -z \"$x86_package_name\" ] || [ -z \"$aarch_package_name\" ]; then\n    echo \"[ERROR]: run package are not in ${hisi_Timestamp}\"\n    exit 1;\nfi\nwget -nv -O ${x86_package_name} \"http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}/${hisi_Timestamp}/${x86_package_name}?op=OPEN&user.name=hadoop\"\nwget -nv -O ${aarch_package_name} \"http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}/${hisi_Timestamp}/${aarch_package_name}?op=OPEN&user.name=hadoop\"\nupload_dir=$(echo ${hisi_Timestamp} | sed 's/_newest//' | sed 's/_//')\nmkdir -p ***//output/${upload_dir}\ncp -r *.run ***//output/${upload_dir}/\n"}
[2026/09/28 11:01:32.468 GMT+08:00] [INFO] [BUILD:build_execute] : []
[2026/09/28 11:01:32.468 GMT+08:00] [INFO] [BUILD:build_execute] : aiEnable: false
[2026/09/28 11:01:32.468 GMT+08:00] [INFO] [BUILD:build_execute] : command:today_Timestamp=$(date +%Y%m)hisi_Timestamp=$(curl "http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}?op=LISTSTATUS&user.name=hadoop" | grep -Eo "[0-9]{8}_[0-9]{9}_newest" | grep $(date +%Y%m%d)_00 | tail -n1)echo "[INFO]: hisi_Timestamp is ${hisi_Timestamp}"aarch_package_name=$(curl "http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}/${hisi_Timestamp}?op=LISTSTATUS&user.name=hadoop" | grep -oE "cann-bisheng-compiler_[^-]*_linux-aarch64\.run" | tail -n1)x86_package_name=$(curl "http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}/${hisi_Timestamp}?op=LISTSTATUS&user.name=hadoop" | grep -oE "cann-bisheng-compiler_[^-]*_linux-x86_64\.run" | tail -n1)if [ -z "$x86_package_name" ] || [ -z "$aarch_package_name" ]; then    echo "[ERROR]: run package are not in ${hisi_Timestamp}"    exit 1;fiwget -nv -O ${x86_package_name} "http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}/${hisi_Timestamp}/${x86_package_name}?op=OPEN&user.name=hadoop"wget -nv -O ${aarch_package_name} "http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/${today_Timestamp}/${hisi_Timestamp}/${aarch_package_name}?op=OPEN&user.name=hadoop"upload_dir=$(echo ${hisi_Timestamp} | sed 's/_newest//' | sed 's/_//')mkdir -p ***//output/${upload_dir}cp -r *.run ***//output/${upload_dir}/
[2026/09/28 11:01:32.469 GMT+08:00] [INFO] [BUILD:build_execute] : start run shell command
[2026/09/28 11:01:32.469 GMT+08:00] [INFO] [BUILD:build_execute] : launching task in ***/ on besd-0928-7vworkeea794fdfw
[2026/09/28 11:01:32.495 GMT+08:00] [INFO] [BUILD:build_execute] : launched task
[2026/09/28 11:01:32.497 GMT+08:00] [INFO] [BUILD:build_execute] : start to get result.
[2026/09/28 11:01:33.004 GMT+08:00] ++ date +%Y%m
[2026/09/28 11:01:33.004 GMT+08:00] + today_Timestamp=202609
[2026/09/28 11:01:33.004 GMT+08:00] ++ curl 'http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/202609?op=LISTSTATUS&user.name=hadoop'
[2026/09/28 11:01:33.004 GMT+08:00] ++ grep -Eo '[0-9]{8}_[0-9]{9}_newest'
[2026/09/28 11:01:33.004 GMT+08:00] ++ tail -n1
[2026/09/28 11:01:33.004 GMT+08:00] +++ date +%Y%m%d
[2026/09/28 11:01:33.004 GMT+08:00] ++ grep 20260928_00
[2026/09/28 11:01:33.004 GMT+08:00]   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
[2026/09/28 11:01:33.004 GMT+08:00]                                  Dload  Upload   Total   Spent    Left  Speed
[2026/09/28 11:01:33.004 GMT+08:00] 
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  263k    0  263k    0     0  4867k      0 --:--:-- --:--:-- --:--:-- 4969k
[2026/09/28 11:01:33.004 GMT+08:00] + hisi_Timestamp=20260928_000124370_newest
[2026/09/28 11:01:33.004 GMT+08:00] + echo '[INFO]: hisi_Timestamp is 20260928_000124370_newest'
[2026/09/28 11:01:33.004 GMT+08:00] [INFO]: hisi_Timestamp is 20260928_000124370_newest
[2026/09/28 11:01:33.004 GMT+08:00] ++ curl 'http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/202609/20260928_000124370_newest?op=LISTSTATUS&user.name=hadoop'
[2026/09/28 11:01:33.004 GMT+08:00] ++ grep -oE 'cann-bisheng-compiler_[^-]*_linux-aarch64\.run'
[2026/09/28 11:01:33.004 GMT+08:00] ++ tail -n1
[2026/09/28 11:01:33.004 GMT+08:00]   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
[2026/09/28 11:01:33.004 GMT+08:00]                                  Dload  Upload   Total   Spent    Left  Speed
[2026/09/28 11:01:33.004 GMT+08:00] 
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  633k    0  633k    0     0  7935k      0 --:--:-- --:--:-- --:--:-- 8021k
[2026/09/28 11:01:33.004 GMT+08:00] + aarch_package_name=cann-bisheng-compiler_9.2.0_linux-aarch64.run
[2026/09/28 11:01:33.004 GMT+08:00] ++ curl 'http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/202609/20260928_000124370_newest?op=LISTSTATUS&user.name=hadoop'
[2026/09/28 11:01:33.004 GMT+08:00] ++ grep -oE 'cann-bisheng-compiler_[^-]*_linux-x86_64\.run'
[2026/09/28 11:01:33.004 GMT+08:00] ++ tail -n1
[2026/09/28 11:01:33.004 GMT+08:00]   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
[2026/09/28 11:01:33.004 GMT+08:00]                                  Dload  Upload   Total   Spent    Left  Speed
[2026/09/28 11:01:33.004 GMT+08:00] 
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  633k    0  633k    0     0  8605k      0 --:--:-- --:--:-- --:--:-- 8681k
[2026/09/28 11:01:33.004 GMT+08:00] + x86_package_name=cann-bisheng-compiler_9.2.0_linux-x86_64.run
[2026/09/28 11:01:33.004 GMT+08:00] + '[' -z cann-bisheng-compiler_9.2.0_linux-x86_64.run ']'
[2026/09/28 11:01:33.004 GMT+08:00] + '[' -z cann-bisheng-compiler_9.2.0_linux-aarch64.run ']'
[2026/09/28 11:01:33.004 GMT+08:00] + wget -nv -O cann-bisheng-compiler_9.2.0_linux-x86_64.run 'http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/202609/20260928_000124370_newest/cann-bisheng-compiler_9.2.0_linux-x86_64.run?op=OPEN&user.name=hadoop'
[2026/09/28 11:01:34.899 GMT+08:00] 2026-09-28 11:01:34 URL:http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/202609/20260928_000124370_newest/cann-bisheng-compiler_9.2.0_linux-x86_64.run?op=OPEN&user.name=hadoop [272717812] -> "cann-bisheng-compiler_9.2.0_linux-x86_64.run" [1]
[2026/09/28 11:01:34.899 GMT+08:00] + wget -nv -O cann-bisheng-compiler_9.2.0_linux-aarch64.run 'http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/202609/20260928_000124370_newest/cann-bisheng-compiler_9.2.0_linux-aarch64.run?op=OPEN&user.name=hadoop'
[2026/09/28 11:01:36.767 GMT+08:00] 2026-09-28 11:01:36 URL:http://hdfs-ngx0.turing-ci.hisilicon.com:14000/webhdfs/v1/compilepackage/CI_Version/cann_eco/br_milan_torino_v100r001c12_main/202609/20260928_000124370_newest/cann-bisheng-compiler_9.2.0_linux-aarch64.run?op=OPEN&user.name=hadoop [273980578] -> "cann-bisheng-compiler_9.2.0_linux-aarch64.run" [1]
[2026/09/28 11:01:36.767 GMT+08:00] ++ echo 20260928_000124370_newest
[2026/09/28 11:01:36.767 GMT+08:00] ++ sed s/_newest//
[2026/09/28 11:01:36.767 GMT+08:00] ++ sed s/_//
[2026/09/28 11:01:36.767 GMT+08:00] + upload_dir=20260928000124370
[2026/09/28 11:01:36.767 GMT+08:00] + mkdir -p ***//output/20260928000124370
[2026/09/28 11:01:36.767 GMT+08:00] + cp -r cann-bisheng-compiler_9.2.0_linux-aarch64.run cann-bisheng-compiler_9.2.0_linux-x86_64.run ***//output/20260928000124370/
[2026/09/28 11:01:37.290 GMT+08:00] [INFO] [BUILD:build_execute] : run command success
[2026/09/28 11:01:37.293 GMT+08:00] [INFO] [BUILD:build_execute] : end to get result.
[2026/09/28 11:01:37.293 GMT+08:00] [INFO] [BUILD:build_execute] : This step is complete

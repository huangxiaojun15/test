https://www.openlibing.com/apps/entryCheckNew?projectId=300130


docker inspect sgl-yzy-cann9.1 --format 'status={{.State.Status}} exit={{.State.ExitCode}} oom={{.State.OOMKilled}} started={{.State.StartedAt}} finished={{.State.FinishedAt}} err={{.State.Error}} entrypoint={{.Config.Entrypoint}} cmd={{.Config.Cmd}}'

docker logs sgl-yzy-cann9.1 2>&1 | tail -30

[root@localhost y30082119]# docker inspect sgl-yzy-cann9.1 --format 'status={{.State.Status}} exit={{.State.ExitCode}} oom={{.State.OOMKilled}} started={{.State.StartedAt}} finished={{.State.FinishedAt}} err={{.State.Error}} entrypoint={{.Config.Entrypoint}} cmd={{.Config.Cmd}}'
status=exited exit=136 oom=false started=2026-10-09T06:46:53.496874495Z finished=2026-10-09T06:46:53.543943062Z err= entrypoint=[bash] cmd=[]
[root@localhost y30082119]# docker logs sgl-yzy-cann9.1 2>&1 | tail -30
[root@localhost y30082119]# 
https://www.hiascend.com/cann/download?versionId=800&ids=d806%2Ch0501%2Ch0601%2Ch0703&currentTab=1

https://www.hiascend.com/cann/download?versionId=800&ids=d806%2Ch0501%2Ch0601%2Ch0703&currentTab=1


https://github.com/Ascend/cann-container-image/blob/main/cann/9.2.0-beta.2-a3-ubuntu22.04-py3.12/Dockerfile

https://github.com/Ascend/cann-container-image/blob/main/cann/9.2.0-beta.2-950-ubuntu22.04-py3.12/Dockerfile

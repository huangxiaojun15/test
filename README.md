https://www.openlibing.com/apps/entryCheckNew?projectId=300130


docker inspect sgl-yzy-cann9.1 --format 'status={{.State.Status}} exit={{.State.ExitCode}} oom={{.State.OOMKilled}} started={{.State.StartedAt}} finished={{.State.FinishedAt}} err={{.State.Error}} entrypoint={{.Config.Entrypoint}} cmd={{.Config.Cmd}}'

docker logs sgl-yzy-cann9.1 2>&1 | tail -30

[root@localhost y30082119]# docker inspect sgl-yzy-cann9.1 --format 'status={{.State.Status}} exit={{.State.ExitCode}} oom={{.State.OOMKilled}} started={{.State.StartedAt}} finished={{.State.FinishedAt}} err={{.State.Error}} entrypoint={{.Config.Entrypoint}} cmd={{.Config.Cmd}}'
status=exited exit=136 oom=false started=2026-10-09T06:46:53.496874495Z finished=2026-10-09T06:46:53.543943062Z err= entrypoint=[bash] cmd=[]
[root@localhost y30082119]# docker logs sgl-yzy-cann9.1 2>&1 | tail -30
[root@localhost y30082119]# 

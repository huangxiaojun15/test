https://www.openlibing.com/apps/entryCheckNew?projectId=300130


docker inspect sgl-yzy-cann9.1 --format 'status={{.State.Status}} exit={{.State.ExitCode}} oom={{.State.OOMKilled}} started={{.State.StartedAt}} finished={{.State.FinishedAt}} err={{.State.Error}} entrypoint={{.Config.Entrypoint}} cmd={{.Config.Cmd}}'

docker logs sgl-yzy-cann9.1 2>&1 | tail -30

# playwright-with-docker-compose
Adds docker and docker-compose to the [playwright image](https://hub.docker.com/r/alpinelinux/docker-compose).

Additionally includes:
- yarn
- git

Can be used as a runner in GitLab like this:

```
docker exec -it gitlab-runner \
  gitlab-runner \
    register -n \
             --name "docker-node" \
             --tag-list "docker-node" \
             --docker-image "jdalrymple/playwright-with-docker-compose:latest" \
             --docker-privileged \
             --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
             --docker-volumes "/cache"
```

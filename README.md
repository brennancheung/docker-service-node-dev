# docker-service-node-dev
A Docker image for Node.js that stays alive when run as a service.

This container is designed to be used for Node.js development work.
Developing an application in a swarm environment creates challenges
because your local machine does not have the other microservices
that are available in your normal swarm environment.  This container
helps solve that problem.

It is recommended that you mount a folder on your local disk
that you use for editing your code.

# Useful commands

Create the service:

```
docker service create --name node-dev \
  --network private \
  --mount type=bind,source=$HOME/docker/node-dev,target=/mnt/node-dev \
  -p 127.0.0.1:3000:80 \
  volgenic/node-dev-service
```

Wait for the service to come up:

`docker service ls`

Connect to the running container:

```
SERVICE_ID=$(docker service ps -q node-dev)
NODE_DEV_CONTAINER=$(docker inspect --format "{{.Status.ContainerStatus.ContainerID}}" $SERVICE_ID | head -1)
docker exec -it $NODE_DEV_CONTAINER bash
```

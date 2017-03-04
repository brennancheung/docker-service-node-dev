FROM volgenic/ubuntu-service:latest

LABEL maintainer "git@brennancheung.com"

RUN apt-get update && apt-get install -y node.js npm

RUN npm install -g n && n latest

ENTRYPOINT ["/bin/sh", "-c", "while true; do sleep 1; done"]

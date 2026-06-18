#!/bin/bash

apt-get update -y
apt-get upgrade -y

apt-get install -y docker.io

systemctl enable docker
systemctl start docker

curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64" \
-o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker run -d \
--name mongodb \
-p 27017:27017 \
--restart always \
mongo:7
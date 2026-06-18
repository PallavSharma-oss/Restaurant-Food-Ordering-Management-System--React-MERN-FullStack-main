#!/bin/bash
set -eux

apt-get update -y

apt-get install -y docker.io git nginx curl unzip

systemctl enable docker
systemctl start docker

systemctl enable nginx
systemctl start nginx

curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64" \
-o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip

unzip -o awscliv2.zip

./aws/install

echo "Frontend Server Ready" > /home/ubuntu/server.txt
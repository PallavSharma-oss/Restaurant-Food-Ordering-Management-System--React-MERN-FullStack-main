#!/bin/bash

apt-get update -y
apt-get upgrade -y

apt-get install -y docker.io

systemctl enable docker
systemctl start docker

curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64" \
-o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

apt-get install -y git

echo "Backend Server Ready" > /home/ubuntu/server.txt

# Install AWS CLI
apt-get install -y unzip curl

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

./aws/install
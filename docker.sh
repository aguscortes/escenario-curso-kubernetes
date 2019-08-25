#!/bin/sh
sudo apt-get update

# install docker
#curl -sSLf https://get.docker.com/ | sh
#curl -sSLf https://get.docker.com/ -o get-docker.sh
sudo apt-get install -y docker.io

#sudo sh get-docker.sh
sudo usermod -aG docker vagrant
systemctl enable docker && systemctl start docker

# install docker machine

# install docker compose
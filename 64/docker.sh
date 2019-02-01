#!/bin/sh
sudo apt-get update

# install docker
curl -sSLf https://get.docker.com/ | sh
#curl -sSLf https://get.docker.com/ -o get-docker.sh
#sudo sh get-docker.sh
sudo usermod -aG docker vagrant
systemctl enable docker && systemctl start docker

# install docker machine

# install docker compose

# install git
sudo apt-get install git -y
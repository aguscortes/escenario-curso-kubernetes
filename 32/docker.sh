#!/bin/sh

apt-get update

# install docker
curl -sSLf https://get.docker.com/ | sh
#curl -sSLf https://get.docker.com/ -o get-docker.sh
#sudo sh get-docker.sh
sudo usermod -aG docker vagrant

# install docker machine

# install docker compose

# install git
sudo apt-get install git -y

# get udemy course code
mkdir code
cd code
git clone https://github.com/BretFisher/udemy-docker-mastery.git
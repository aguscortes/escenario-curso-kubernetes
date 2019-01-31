#!/bin/sh

apt-get update

# install git
sudo apt-get install git -y

# install project
git clone https://gitlab.com/byaguscortes/monitoring-tasks.git
python3 -m venv dev
source dev/bin/activate
pip install flask
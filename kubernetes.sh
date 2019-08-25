#!/bin/sh
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get update
sudo apt-get install kubelet kubeadm kubectl -y
systemctl enable kubelet && systemctl start kubelet
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.define "wrk01" do |wrk01|
    wrk01.vm.box = "ubuntu/xenial64"
    wrk01.vm.hostname = 'wrk01'
    wrk01.vm.box_url = "ubuntu/xenial64"

    # wrk01.vm.network :private_network, ip: "192.168.55.101"
    wrk01.vm.network "public_network", ip: "192.168.1.100"

    wrk01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "wrk01"]
    end
  end
  
  config.vm.define "wrk02" do |wrk02|
    wrk02.vm.box = "ubuntu/xenial64"
    wrk02.vm.hostname = 'wrk02'
    wrk02.vm.box_url = "ubuntu/xenial64"

    #wrk02.vm.network :private_network, ip: "192.168.55.102"
    wrk02.vm.network "public_network", ip: "192.168.1.101"

    wrk02.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "wrk02"]
    end
  end

  config.vm.define "wrk03" do |wrk03|
    wrk03.vm.box = "ubuntu/xenial64"
    wrk03.vm.hostname = 'wrk03'
    wrk03.vm.box_url = "ubuntu/xenial64"

    #wrk03.vm.network :private_network, ip: "192.168.55.103"
    wrk03.vm.network "public_network", ip: "192.168.1.102"

    wrk03.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "wrk03"]
    end
  end

  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/xenial64"
    master.vm.hostname = 'master'
    master.vm.box_url = "ubuntu/xenial64"

    #master.vm.network :private_network, ip: "192.168.55.100"
    master.vm.network "public_network", ip: "192.168.1.103"

    master.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "master"]
    end
    master.vm.provision "shell", path: 'kubeadm.sh'
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo swapoff -a
    sudo sh -c 'echo "192.168.1.103 master" >> /etc/hosts'
    sudo sh -c 'echo "192.168.1.100 wrk01" >> /etc/hosts'
    sudo sh -c 'echo "192.168.1.101 wrk02" >> /etc/hosts'
    sudo sh -c 'echo "192.168.1.102 wrk03" >> /etc/hosts'
    sudo sh -c 'echo "net.bridge.bridge-nf-call-ip6tables = 1" >> /etc/sysctl.d/k8s.conf'
    sudo sh -c 'echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.d/k8s.conf'
    sudo sysctl --system    
  SHELL
  config.vm.provision "shell", path: 'docker.sh'
  config.vm.provision "shell", path: 'kubernetes.sh'  
end  

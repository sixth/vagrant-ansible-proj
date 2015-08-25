#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/ansible/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# configure hosts file with the internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.5.10  mgmt
10.0.5.11  lb
10.0.5.21  web1
10.0.5.22  web2
10.0.5.23  web3
10.0.5.24  web4
10.0.5.25  web5
EOL

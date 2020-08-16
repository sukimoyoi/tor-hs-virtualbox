#/bin/bash

prod=`pwd`

# provisioning
cd $prod/vagrant
if [ "`vagrant box list | grep 'ubuntu-16.04'`" == "" ]; then
	vagrant box add ubuntu-16.04 https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box
fi
vagrant up

# run ansible-playbook
cd $prod/ansible
ansible-playbook --private-key=$prod/vagrant/.vagrant/machines/default/virtualbox/private_key tor-hs.yml

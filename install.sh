#!/bin/bash

#Instalação
sudo apt-get update
sudo apt-get upgrade

#Complementos
sudo apt-get install linux-headers-$(uname -r)
	
#Virtualbox
echo "=[ Iniciando Instalacao Virtualbox ]======================================================"
echo " deb http://download.virtualbox.org/virtualbox/debian precise contrib " | sudo tee -a /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get install virtualbox-4.3
	
#Vagrant
echo "=[ Iniciando Instalacao Vagrant ]========================================================="
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.2_x86_64.deb
sudo dpkg --install vagrant_1.4.2_x86_64.deb
sudo rm vagrant_1.4.2_x86_64.deb

#Puppet
echo "=[ Iniciando Instalacao Puppet ]========================================================="
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get install puppet-common
sudo rm puppetlabs-release-precise.deb

#Plugins
echo "=[ Iniciando Instalacao Vagrant Plugins ]================================================="

#https://github.com/fgrehm/vagrant-cachier
vagrant plugin install vagrant-cachier
	
#https://github.com/mindreframer/vagrant-puppet-librarian
vagrant plugin install vagrant-librarian-puppet

#https://github.com/smdahlen/vagrant-hostmanager
vagrant plugin install vagrant-hostmanager
	
vagrant --version

#Desisntalação
#sudo apt-get autoremove --purge Virtualbox* vagrant

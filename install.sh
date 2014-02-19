#!/bin/bash

#Complementos
sudo apt-get install linux-headers-$(uname -r)
	
#Virtualbox
#=[ Iniciando Instalacao Virtualbox ]======================================================"
echo " deb http://download.virtualbox.org/virtualbox/debian precise contrib " | sudo tee -a /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get install virtualbox-4.3
	
#Vagrant
#=[ Iniciando Instalacao Vagrant ]========================================================="

if $(uname -m | grep '64'); then
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_x86_64.deb
else
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.deb
fi

sudo dpkg -i vagrant_1.4.3_*.deb
sudo rm vagrant_1.4.3_*.deb

#Puppet
#=[ Iniciando Instalacao Puppet ]========================================================="
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
sudo apt-get install puppet-common
sudo rm puppetlabs-release-precise.deb

#Plugins
#=[ Iniciando Instalacao Vagrant Plugins ]================================================="

#https://github.com/fgrehm/vagrant-cachier
sudo vagrant plugin install vagrant-cachier
	
#https://github.com/mindreframer/vagrant-puppet-librarian
sudo vagrant plugin install vagrant-librarian-puppet

#https://github.com/smdahlen/vagrant-hostmanager
sudo vagrant plugin install vagrant-hostmanager
	
vagrant --version

#Desisntalação
#sudo apt-get autoremove --purge Virtualbox* vagrant puppet

#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Virtualbox and Vagrant 
#
#	reference https://www.virtualbox.org/wiki/Linux_Downloads
#
######################################################################

sudo apt-get install linux-headers-$(uname -r)
sudo apt-get update

# Virtualbox ========================================================
echo " deb http://download.virtualbox.org/virtualbox/debian precise contrib " | sudo tee -a /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

sudo apt-get install virtualbox-4.3
sudo apt-get install dkms

# Vagrant ===========================================================
if $(uname -m | grep '64'); then
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_x86_64.deb
else
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.deb
fi

sudo dpkg -i vagrant_1.4.3_*.deb
sudo rm vagrant_1.4.3_*.deb

# Vagrant Plugins ===================================================

#reference https://github.com/fgrehm/vagrant-cachier
sudo vagrant plugin install vagrant-cachier
	
#reference  https://github.com/smdahlen/vagrant-hostmanager
sudo vagrant plugin install vagrant-hostmanager

#reference https://github.com/dotless-de/vagrant-vbguest
sudo vagrant plugin install vagrant-vbguest
	
vagrant --version

#Uninstall
#sudo apt-get autoremove --purge Virtualbox* vagrant

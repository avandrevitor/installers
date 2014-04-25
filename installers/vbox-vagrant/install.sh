#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Virtualbox and Vagrant 
#
#	reference https://www.virtualbox.org/wiki/Linux_Downloads
#
######################################################################

# Root ? 
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Change to use with Vagrant
sudo -i

apt-get purge -y openjdk*
apt-get update
apt-get autoclean
export DEBIAN_FRONTEND=noninteractive

# Virtualbox ========================================================
echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib " | sudo tee -a /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
apt-get update
apt-get install -y virtualbox-4.3

# Vagrant ===========================================================
if $(uname -m | grep '64'); then
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_x86_64.deb
else
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.deb
fi

dpkg -i vagrant_1.4.3_*.deb
rm vagrant_1.4.3_*.deb

# Vagrant Plugins ===================================================
vagrant --version

#reference https://github.com/fgrehm/vagrant-cachier
vagrant plugin install vagrant-cachier
#reference  https://github.com/smdahlen/vagrant-hostmanager
vagrant plugin install vagrant-hostmanager
#reference https://github.com/dotless-de/vagrant-vbguest

#Uninstall
#sudo apt-get autoremove --purge virtualbox* vagrant

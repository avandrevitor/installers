#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Virtualbox and Vagrant 
#
#	reference https://www.virtualbox.org/wiki/Linux_Downloads
#
######################################################################

sudo -i
apt-get purge -y openjdk*
apt-get update
apt-get autoclean
DEBIAN_FRONTEND=noninteractive apt-get install -y linux-headers-$(uname -r) build-essential git vim

# Java 8 ===========================================================
DEBIAN_FRONTEND=noninteractive apt-get install -y python-software-properties
DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:webupd8team/java
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer
java -version

# Virtualbox ========================================================
echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib " | sudo tee -a /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y virtualbox-4.3

# Vagrant ===========================================================
if $(uname -m | grep '64'); then
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_x86_64.deb
else
	wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.deb
fi

DEBIAN_FRONTEND=noninteractive dpkg -i vagrant_1.4.3_*.deb
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

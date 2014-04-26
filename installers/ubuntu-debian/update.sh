#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Server 
#
######################################################################

sudo -i

# UPDATE ===========================================================
export DEBIAN_FRONTEND=noninteractive
apt-get purge -y openjdk*
apt-get update --fix-missing
#apt-get -y install python-software-properties
#add-apt-repository ppa:ondrej/php5
#apt-get update
apt-get autoclean
apt-get install -y linux-headers-$(uname -r) build-essential git vim tar rar unrar zip unzip gzip bzip2 ntp htop curl libapr1-dev libaprutil1-dev


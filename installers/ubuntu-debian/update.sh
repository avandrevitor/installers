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
apt-get update
apt-get -y install python-software-properties
add-apt-repository ppa:ondrej/php5
apt-get update
apt-get autoclean

apt-get install -y linux-headers-$(uname -r) build-essential git vim tar rar unrar zip unzip gzip bzip2 ntp htop curl autoremove make cmake autoconf2.13 gcc g++ libtool wget bison openssl libssl0.9 libssl-dev libsasl2-2 libsasl2-dev zlibc zlib1g zlib1g-dev libfreetype6 libfreetype6-dev libxml2 libxml2-dev libmhash2 libmhash-dev libcurl3 libcurl4-openssl-dev libevent-devlibncurses5 libncurses5-dev libltdl7 libltdl-dev libc-client2007e libc-client2007e-dev libapr1-dev libaprutil1-dev


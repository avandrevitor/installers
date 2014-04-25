#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Java 8
#
######################################################################

sudo -i

# Java 8 ===========================================================
export DEBIAN_FRONTEND=noninteractive

apt-get install -y python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer
java -version

exit

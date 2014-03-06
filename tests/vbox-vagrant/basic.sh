#!/bin/sh

sudo apt-get purge openjdk*
wget http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jre-7u51-linux-i586.tar.gz
tar -xvf ./jre-7u51-linux-i586.tar.gz
sudo mkdir -p /usr/lib/jvm/jre1.7.0
sudo mv jre1.7.0_03/* /usr/lib/jvm/jre1.7.0/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jre1.7.0/bin/java 0

sudo apt-get update
sudo apt-get autoclean
sudo apt-get install git-core vim -y

#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Veewee 
#
######################################################################

sudo -i
export DEBIAN_FRONTEND=noninteractive

# Requirements  =========================================================
apt-get install -y install git ruby ruby-dev build-essential libxslt1-dev libxml2-dev

# Install ===============================================================
gem install fog --version 1.8
gem install veewee --pre

git clone https://github.com/jedi4ever/veewe

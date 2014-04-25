#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Apache HTTP 
#
######################################################################

sudo -i

# APACHE2 ===========================================================
export DEBIAN_FRONTEND=noninteractive

dpkg -P apache2 apache2.2-common apache2-doc apache2-mpm-prefork apache2-utils mysql-common libmysqlclient15off libmysqlclient15-dev php

# wget http://ftp.unicamp.br/pub/apache//httpd/httpd-2.4.9.tar.bz2
#DEBIAN_FRONTEND=noninteractive tar -jxvf httpd-*.tar.bz2
#cd httpd-*
#./configure --prefix=/usr/local/apache --enable-mods-shared=most --enable-ssl=shared --with-mpm=prefork
#make && make install

apt-get install -y apache2 apache2-utils apache2-mpm-prefork libapache2-mod-php5
a2enmod rewrite

/etc/init.d/apache2 restart

exit

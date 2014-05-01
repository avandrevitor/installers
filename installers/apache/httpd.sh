#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Apache HTTP 
#
######################################################################

sudo -i

# APACHE2 ===========================================================
export DEBIAN_FRONTEND=noninteractive

apt-get autoremove --purge -y  apache2 apache2.2-common apache2-doc apache2-mpm-prefork apache2-utils libmysqlclient15off libmysqlclient15-dev php5 mysql-common

apt-get install -y apache2 apache2-utils apache2-mpm-prefork
a2enmod rewrite

sed -i "s/LockFile ${APACHE_LOCK_DIR}/accept.lock/Mutex file:${APACHE_LOCK_DIR} default/" /etc/apache2/apache2.conf
echo "ServerName localhost" >> /etc/apache2/httpd.conf

/etc/init.d/apache2 restart


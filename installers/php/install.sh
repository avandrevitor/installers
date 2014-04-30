#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer PHP5.4 FOR APACHE2
#
######################################################################

sudo -i

# PHP ===========================================================
export DEBIAN_FRONTEND=noninteractive

echo "deb http://ftp.br.debian.org/debian wheezy main contrib non-free" | tee -a /etc/apt/sources.list

apt-get install -y php5 php5-cli php5-common php5-curl php5-gd php5-mysql php5-recode php5-gmp php5-xmlrpc php5-xsl php5-intl php5-mcrypt php5-suhosin php5-imagick libapache2-mod-php5

sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10M/" /etc/php5/apache2/php.ini
sed -i "s/short_open_tag = On/short_open_tag = Off/" /etc/php5/apache2/php.ini
sed -i "s/;date.timezone =/date.timezone = America\/Sao_Paulo/" /etc/php5/apache2/php.ini
sed -i "s/memory_limit = 128M/memory_limit = 256M/" /etc/php5/apache2/php.ini
sed -i "s/_errors = Off/_errors = On/" /etc/php5/apache2/php.ini
sed -i "s/error_reporting = -1/error_reporting = 30711/" /etc/php5/apache2/php.ini #E_ALL & ~E_NOTICE & ~E_STRICT

/etc/init.d/apache2 restart


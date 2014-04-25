#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu Installer Composer 
#
######################################################################

sudo -i

# COMPOSER ===========================================================
export DEBIAN_FRONTEND=noninteractive

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

exit

#!/bin/bash
#######################################################################
#
#	Debian/Ubuntu APACHE CREATE VHOST
#
######################################################################

sudo -i

# VHOST ===========================================================
export DEBIAN_FRONTEND=noninteractive

SERVERNAME=$(echo $1 | tr "[:upper:]" "[:lower:]")
DOCUMENT_ROOT=$(echo $2 | tr "[:upper:]" "[:lower:]")

echo "<VirtualHost *:80>

	ServerName $SERVERNAME
	ServerAlias www.$SERVERNAME
    
	DocumentRoot '"$DOCUMENT_ROOT"'

	SetEnv APP_ENV dev

    <Directory '"$DOCUMENT_ROOT"'>
    
	Options Indexes FollowSymLinks Multiviews
	DirectoryIndex index.php
        AllowOverride All
        Order allow,deny
        Allow from all

    </Directory>

    ErrorLog $DOCUMENT_ROOT/error.log
    CustomLog $DOCUMENT_ROOT/access.log combined

</VirtualHost>" > /etc/apache2/sites-available/mysite.conf

mkdir -p $DOCUMENT_ROOT

a2ensite mysite

echo "127.0.1.1		$SERVERNAME" >> /etc/hosts

/etc/init.d/apache2 restart

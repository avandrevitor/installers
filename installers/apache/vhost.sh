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

VHOST=<<EOF 
<VirtualHost *:80>

	ServerName $SERVERNAME
	ServerAlias www.$SERVERNAME
    
	DocumentRoot "$DOCUMENT_ROOT"

	SetEnv APP_ENV dev

    <Directory "$DOCUMENT_ROOT">
    
	Options Indexes FollowSymLinks Multiviews
	DirectoryIndex index.php
        AllowOverride All
        Order allow,deny
        Allow from all

    </Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF

touch /etc/apache2/sites-available/$SERVERNAME
echo $VHOST > /etc/apache2/sites-available/$SERVERNAME

mkdir -p $DOCUMENT_ROOT
a2ensite $SERVERNAME

echo "127.0.1.1		$SERVERNAME" >> /etc/hosts

/etc/init.d/apache2 restart

exit

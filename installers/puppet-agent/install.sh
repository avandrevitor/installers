#!/bin/bash
#############################################################################################
#
#	Debian/Ubuntu Installer Puppet Agent 
#
##############################################################################################

# Root ? 
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Change to use with Vagrant
# sudo -i

DEBIAN_FRONTEND=noninteractive git clone https://github.com/petems/puppet-install-shell.git
DEBIAN_FRONTEND=noninteractive sh ./puppet-install-shell/install_puppet.sh


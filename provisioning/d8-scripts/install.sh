#!/bin/bash

CWD=`pwd`

if [ "$CWD" != "/var/www/dev1.d8.local" ]
then
    echo "You must run this inside /var/www/dev1.d8.local"
    exit 1
fi

provisioning/install_drupal.sh
provisioning/workbench_install.sh
provisioning/multiversion_install.sh
provisioning/config_update.sh

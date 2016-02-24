#!/bin/bash

CWD=`pwd`

if [ "$CWD" != "/var/www/dev1.d8.local" ]
then
    echo "You must run this inside /var/www/dev1.d8.local"
    exit 1
fi

provisioning/bin/install_drupal.sh
provisioning/bin/multiversion_install.sh
provisioning/bin/workbench_install.sh
provisioning/bin/config_update.sh

#!/bin/bash

SILENT=0
CWD=`pwd`

if [ "$CWD" != "/var/www/dev1.d8.local" ]
then
    echo "You must run this inside /var/www/dev1.d8.local"
    exit 1
fi

if [ "$1" == "--quiet" ]
then
    echo "Entering quiet mode. No user interaction will take place."
fi

provisioning/bin/install_drupal.sh
if [ ! $SILENT ]
then
    provisioning/bin/multiversion_install.sh
    provisioning/bin/workbench_install.sh
else
    echo "Skipping installation of modules, because quiet mode."
fi
provisioning/bin/config_update.sh

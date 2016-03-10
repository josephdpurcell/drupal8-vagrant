#!/bin/bash

SILENT=0

if [ "$1" == "--quiet" ]
then
    echo "Entering quiet mode. No user interaction will take place."
fi

cd /var/www/dev1.d8.local

provisioning/bin/drupal_install.sh
if [ ! $SILENT ]
then
    provisioning/bin/modules_install.sh
else
    echo "Skipping installation of modules, because quiet mode."
fi
provisioning/bin/config_update.sh

#!/bin/bash

echo -n "Install multiversion? [Y|n]: "
read INSTALL_MULTIVERSION

function __install_multiversion() {
    cd web/modules
    echo "Downloading Multiversion."
    if [ ! -d "multiversion" ]
    then
        git clone --branch "8.x-1.x" "josephdpurcell@git.drupal.org:project/multiversion.git"
    else
        echo "Multiversion already downloaded."
    fi
    cd ..
    drush en multiversion -y
    drush en multiversion_ui -y
    cd ..
}

if [ -z $INSTALL_MULTIVERSION ] || [ $INSTALL_MULTIVERSION == "Y" ] || [ $INSTALL_MULTIVERSION == "y" ] || [ $INSTALL_MULTIVERSION == "yes" ]
then
    __install_multiversion
fi

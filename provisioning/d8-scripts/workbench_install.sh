#!/bin/bash

echo -n "Install workbench moderation? [Y|n]: "
read INSTALL_WORKBENCH_MODERATION

function __install_workbench_moderation() {
    cd web/modules
    echo "Downloading WorkBench Moderation."
    if [ ! -d "workbench_moderation" ]
    then
        git clone --branch "8.x-1.x" "josephdpurcell@git.drupal.org:project/workbench_moderation.git"
    else
        echo "Workbench Moderation already downloaded."
    fi
    cd ..
    drush en workbench_moderation -y
    cd ..
}

if [ -z $INSTALL_WORKBENCH_MODERATION ] || [ $INSTALL_WORKBENCH_MODERATION == "Y" ] || [ $INSTALL_WORKBENCH_MODERATION == "y" ] || [ $INSTALL_WORKBENCH_MODERATION == "yes" ]
then
    __install_workbench_moderation
fi

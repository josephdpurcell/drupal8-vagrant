#!/bin/bash

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

function __install_workspace() {
    cd web/modules
    echo "Downloading Workspace."
    if [ ! -d "workspace" ]
    then
        git clone --branch "8.x-1.x" "https://git.drupal.org/project/workspace.git"
    else
        echo "Workspace already downloaded."
    fi
    cd ..
    drush en workspace -y
    cd ..
}

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

function __is_install_desired() {
    local module_name
    local install_module
    local is_install_desired

    module_name = $1

    echo -n "Install $module_name? [Y|n]: "
    read install_module

    if [ -z $install_module ] || [ $install_module == "Y" ] || [ $install_module == "y" ] || [ $install_module == "yes" ]
        is_install_desired=1
    else
        is_install_desired=0
    fi

    return $is_install_desired
}

INSTALL=`__is_install_desired "multiversion"`
INSTALL && __install_multiversion

INSTALL=`__is_install_desired "workspace"`
INSTALL && __install_workspace

INSTALL=`__is_install_desired "workbench_moderation"`
INSTALL && __install_workbench_moderation


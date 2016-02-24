#!/bin/bash

# Run this inside the vm

# This needs tied into the ansible script before Drupal things:
# Note: the crazy cd'ing into tmp is to avoid the question of "Do you want to remove exisitng .git?"
cd /var/www/dev1.d8.local/
mkdir tmp
cd tmp
composer create-project drupal/drupal dev1.d8.local 8.0.*@dev
cd ..
mv tmp/dev1.d8.local web
rm -rf tmp


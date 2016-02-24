#!/bin/bash

cd web
drush sql-drop -y
drush si -y
drush upwd --password="pass" admin
drush en admin_toolbar -y
drush en devel -y
drush en simpletest -y
cd ..


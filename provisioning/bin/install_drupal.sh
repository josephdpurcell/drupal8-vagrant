#!/bin/bash

# Create the Drupal
echo "Creating the Drupal project with composer..."
if [ ! -d "web" ]
then
    mkdir tmp
    cd tmp
    composer create-project drupal/drupal dev1.d8.local 8.0.*@dev
    cd ..
    mv tmp/dev1.d8.local web
    rm -rf tmp
else
    echo "A Drupal project already exists. Skipping."
fi

# Do site install
echo "Installing Drupal site."
cd web
drush sql-drop -y
drush si -y
drush upwd --password="pass" admin
drush en admin_toolbar -y
drush en devel -y
drush en simpletest -y
cd ..

# Link to simpletest
echo "Linking to simpletest..."
if [ ! -x /usr/local/bin/install.sh ]
then
    echo -e '#!/bin/bash\nphp /var/www/dev1.d8.local/web/core/scripts/run-tests.sh $@' | sudo tee /usr/local/bin/run-tests.sh
    sudo chmod +x /usr/local/bin/run-tests.sh
else
    echo "Symlink already created. Skipping."
fi


#!/bin/bash

echo "Examples":
echo 'export SIMPLETEST_DB=mysql://root:pass@localhost/default; ../vendor/bin/phpunit --group now'
echo 'run-tests.sh --verbose --class "Drupal\multiversion\Tests\WorkspaceTest"'
echo 'run-tests.sh --verbose --module workbench_moderation'

echo 'php ./core/scripts/run-tests.sh --color --verbose --dburl mysql://root:pass@localhost/d8 --class "Drupal\Tests\workspace\Functional\ReplicatorManagerTest"'

# This is how to do it with phpunit:
echo 'vagrant@sites:/var/www/sites.local/d8/docroot/core$ sudo -u www-data SIMPLETEST_DB=mysql://root:pass@localhost/d8 SIMPLETEST_BASE_URL=http://sites.local ../../vendor/bin/phpunit -v /var/www/sites.local/d8/docroot/modules/contrib/workspace/tests/src/Functional/ReplicationSettingsTest.php'


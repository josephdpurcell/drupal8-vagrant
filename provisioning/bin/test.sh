#!/bin/bash

echo "Examples":
echo 'export SIMPLETEST_DB=mysql://root:pass@localhost/default; ../vendor/bin/phpunit --group now'
echo 'run-tests.sh --verbose --class "Drupal\multiversion\Tests\WorkspaceTest"'
echo 'run-tests.sh --verbose --module workbench_moderation'

# Drupal 8 Vagrant

This is a Vagrant configuration for D8 that is meant for development on your local machine.

(Note: there is zero security on this machine, so don't use it in public where someone may want to hack you, e.g. a coffee shop.)

## Getting Started

To get the vm up and running:

1. git clone INSERT_REPO_GIT_URL dev1.d8.local
1. cd INSERT_REPO_NAME
1. vagrant up
1. vagrant ssh
1. cd /var/www/dev1.d8.local
1. ./provisioning/bin/install.sh

You can now visit [http://dev1.d8.local](http://dev1.d8.local).

Admin credentials:

```
Username: admin
Password: pass
```

## Multiple VMs

To create multiple vms (e.g. a dev1.d8.local and a dev2.d8.local):

1. git clone INSERT_REPO_GIT_URL dev2.d8.local
1. cd INSERT_REPO_NAME
1. String replace all "dev1" to "dev2" in this repository.
1. Modify Vagrant `ip` to 10.33.60.12
1. vagrant up
1. vagrant ssh
1. cd /var/www/dev1.d8.local
1. ./provisioning/bin/install.sh

You can now visit [http://dev2.d8.local](http://dev2.d8.local).

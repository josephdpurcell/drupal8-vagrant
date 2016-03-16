# Drupal 8 Vagrant

This is a Vagrant configuration for D8 that is meant for development on your local machine.

(Note: there is zero security on this machine, so don't use it in public where someone may want to hack you, e.g. a coffee shop.)

## Getting Started

To get the vm up and running:

1. `git clone git@github.com:josephdpurcell/drupal8-vagrant.git dev1.d8.local`
1. `cd dev1.d8.local`
1. `vagrant up`
1. `vagrant ssh`
1. `cd /var/www/dev1.d8.local`
1. `./provisioning/bin/install.sh`
1. Choose "N" for installing multiversion and workbench since it's hard coded to user josephdpurcell

You can now visit [http://dev1.d8.local](http://dev1.d8.local).

Admin credentials:

```
Username: admin
Password: pass
```

## Multiple VMs

To create multiple vms (e.g. a dev1.d8.local and a dev2.d8.local):

1. `git clone git@github.com:josephdpurcell/drupal8-vagrant.git dev2.d8.local`
1. `cd dev2.d8.local`
1. String replace all "dev1" to "dev2" in this repository.
1. Modify Vagrant `ip` to `10.33.60.12`
1. `vagrant up`
1. `vagrant ssh`
1. `cd /var/www/dev1.d8.local`
1. `./provisioning/bin/install.sh`
1. Choose "N" for installing multiversion and workbench since it's hard coded to user josephdpurcell

You can now visit [http://dev2.d8.local](http://dev2.d8.local).

## Developing with Multiversion or Workbench Moderation

Working with modules that do significant changes to database schema can make it challenging to enable, disable, or update without causing some form of errors related to data and state corruption.

As such, this repo comes with a script that you can run every time you want to completely re-build Drupal. Essentially, it just does site install, enables the appropriate modules, and sets the admin pass.

1. `vagrant ssh`
1. `cd /var/www/dev1.d8.local`
1. `./provisioning/bin/install.sh`
1. Choose "N" for installing multiversion nd workbench since it's hard coded to user josephdpurcell

## TODO

1. Add script to upgrade Drupal core
1. Integrate the composer drupal install to the ansible script (see provisioning/todo.sh)
1. Make getting multiversion and workbench_moderation modules not dependent on josephdpurcell username
1. Add xdebug cfg

example xdebug config:

#xdebug.remote_enable=on
#xdebug.remote_handler=dbgp
#xdebug.remote_host=10.33.60.1
#xdebug.remote_port=9000
#xdebug.remote_autostart=1

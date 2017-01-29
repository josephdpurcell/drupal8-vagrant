# Drupal 8 Vagrant

This is a Vagrant configuration for D8 that is meant for development on your local machine.

(Note: there is zero security on this machine, so don't use it in public where someone may want to hack you, e.g. a coffee shop.)

## Getting Started

To get the vm up and running:

1. `git clone git@github.com:josephdpurcell/drupal8-vagrant.git test.local`
1. `cd test.local`
1. `vagrant up`
1. `vagrant ssh`
1. `cd /var/www/test.local`

You can now visit [http://test.local](http://test.local).

Admin credentials:

```
Username: admin
Password: pass
```

## Multiple VMs

To create multiple vms (e.g. a test.local and a dev2.d8.local):

1. `git clone git@github.com:josephdpurcell/drupal8-vagrant.git dev2.d8.local`
1. `cd dev2.d8.local`
1. String replace all "dev1" to "dev2" in this repository.
1. Modify Vagrant `ip` to `10.33.60.12`
1. `vagrant up`
1. `vagrant ssh`
1. `cd /var/www/test.local`

You can now visit [http://dev2.d8.local](http://dev2.d8.local).

## TODO

1. Find a nice solution to web vs web/docroot
1. Add script to upgrade Drupal core
1. Integrate the composer drupal install to the ansible script (see provisioning/todo.sh)
1. Add xdebug cfg

example xdebug config:

```
#xdebug.remote_enable=on
#xdebug.remote_handler=dbgp
#xdebug.remote_host=10.33.60.1
#xdebug.remote_port=9000
#xdebug.remote_autostart=1
```

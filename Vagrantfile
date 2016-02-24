# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-hostmanager")
    raise "vagrant-hostmanager plugin is not installed"
end

# tunables
env_prefix  = ENV['DRUPAL8_VAGRANT_ENV_PREFIX'] || 'DRUPAL8_VAGRANT'
ip          = ENV["#{env_prefix}_IP"] || '10.33.60.11'
project     = ENV["#{env_prefix}_PROJECT"] || 'dev1.d8'
# end tunables

Vagrant.configure(2) do |config|

    config.ssh.private_key_path = "/Users/joepurcell/.ssh/id_rsa"

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true

    config.vm.define "#{project}" do |box|

    box.vm.box = "palantir/ubuntu-default"
    box.vm.box_version = ">= 1.1.4"

    box.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = "1024"
    end

    box.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    box.vm.hostname = "#{project}.local"
    box.vm.network :private_network, ip: ip

    box.vm.synced_folder ".", "/vagrant", :disabled => true
    box.vm.synced_folder ".", "/var/www/#{project}.local", :nfs => true

    box.ssh.forward_agent = true

    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/drupal8-skeleton.yml"

        ansible.groups = {
            "all:children" => ["#{project}"]
        }
    end

end

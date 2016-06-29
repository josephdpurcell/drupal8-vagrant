# Modify these configurations:
ip          = '10.33.60.11'
project     = 'dev1.d8'
memory      = '1024'
cpus        = '1'

Vagrant.configure(2) do |config|

    if Vagrant.has_plugin?("vagrant-hostmanager")
        config.hostmanager.enabled = true
        config.hostmanager.manage_host = true
    end

    config.vm.define "#{project}" do |box|

        box.vm.box = "ubuntu/trusty64"

        box.vm.provider "vmware_fusion" do |v|
            v.vmx["memsize"] = memory
            v.vmx["numvcpus"] = cpus
        end

        box.vm.provider "virtualbox" do |vb|
            vb.memory = memory
            vb.cpus = cpus
        end

        box.vm.hostname = "#{project}.local"
        box.vm.network :private_network, ip: ip

        box.vm.synced_folder ".", "/vagrant", :disabled => true
        box.vm.synced_folder ".", "/var/www/#{project}.local", :nfs => true, :mount_options => ['vers=3']

        box.ssh.forward_agent = true

    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/playbook.yml"
    end

end

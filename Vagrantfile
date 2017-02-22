# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.8.0"

Vagrant.configure("2") do |config|
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    config.ssh.forward_agent = true

    config.vm.box = "ubuntu/trusty64"
    config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box"

    config.vm.network :private_network, ip: "192.168.33.10"
    config.vm.network "forwarded_port", guest: 8000, host: 8094
    config.vm.network "forwarded_port", guest: 35729, host: 35729

    config.vm.hostname = "shopware.local"

    #config.vm.synced_folder "../src", "/home/vagrant/www/shopware", create: true, type: "smb"
    #config.vm.synced_folder "../src", "/home/vagrant/www/shopware", create: true, type: "nfs"
    #config.vm.synced_folder "../src", "/home/vagrant/www/shopware", create: true;

    config.vm.provider :virtualbox do |vb|
        vb.name = "vagrant_shopware";
        vb.customize ["modifyvm", :id, "--cpus", 4]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
        vb.customize ["modifyvm", :id, "--memory", 2048]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

      # Run Ansible from the Vagrant VM
      config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "ansible/playbook.yml"
        ansible.extra_vars = {
          "shopware_app_host" => "192.168.33.10",
          "mysql_root_password" => "shopware"
        }
      end
end

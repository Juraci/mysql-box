# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :db do |db_config|
    db_config.vm.box = 'ubuntu/trusty64'
    db_config.vm.network :private_network, ip: '192.168.33.42'

    db_config.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'database_servers.yml'
      ansible.limit = 'db'
      ansible.sudo = true
      ansible.inventory_path = 'hosts'
      ansible.extra_vars = {
        ansible_ssh_user: 'vagrant'
      }
    end

    db_config.vm.provider 'virtualbox' do |v|
      v.memory = 1024
    end
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Define nodes
nodes = [
	{ :name => "node1", :ip => "192.168.50.101" },
	{ :name => "node2", :ip => "192.168.50.102" },
	{ :name => "node3", :ip => "192.168.50.103" }
]

# Vagrant configuration
Vagrant.configure("2") do |config|

	# All vms
	config.hostmanager.enabled = true
	config.vm.box = "generic/centos7"

	config.vm.provider 'virtualbox' do |vb|
		vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
		vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
		vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
		vb.memory = 1024
	end

	# Control machine configuration
	config.vm.define "control" do |control|
		control.vm.network "private_network", ip: "192.168.50.10"
		control.vm.hostname = "control"
	end

	# Proxy machine configuration
	config.vm.define "proxy" do |proxy|
		proxy.vm.network "private_network", ip: "192.168.50.20"
		proxy.vm.hostname = "proxy"
		proxy.vm.provision "ansible" do |ansible|
			ansible.playbook = "./ansible/proxy-setup.yml"
		end
	end

	# Node machines configuration
	nodes.each do |node|
		config.vm.define node[:name] do |nodeconfig|
			nodeconfig.vm.network "private_network", ip: node[:ip]
			nodeconfig.vm.hostname = node[:name]
			nodeconfig.hostmanager.enabled = true
			nodeconfig.vm.synced_folder "./config", "/vagrant"
			nodeconfig.vm.provision "ansible" do |ansible|
				ansible.playbook = "./ansible/docker-setup.yml"
				ansible.groups = {
					"manager" => ["node1"],
					"workers" => ["node[1:2]"],
				}
			end
		end
	end
end

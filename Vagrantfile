# -*- mode: ruby -*-
# vi: set ft=ruby :

# Define default network name
bridge_name = `ip route | grep '^default' | awk '{print $5}'`.strip

# Define nodes
nodes = [
  { :name => "node1", :ip => "192.168.50.101" },
  { :name => "node2", :ip => "192.168.50.102" },
  { :name => "node3", :ip => "192.168.50.103" }
]

# Vagrant configuration
Vagrant.configure("2") do |config|

  # Control machine configuration
  config.vm.define "control" do |control|
    control.vm.box = "centos/7"
    control.vm.network "private_network", ip: "192.168.50.10"
    control.vm.network "public_network", bridge: bridge_name
    control.vm.hostname = "control"
    control.hostmanager.enabled = true
	control.vm.provision "shell", path: "util-setup.sh"
  end

  # Proxy machine configuration
  config.vm.define "proxy" do |proxy|
    proxy.vm.box = "centos/7"
    proxy.vm.network "private_network", ip: "192.168.50.20"
    proxy.vm.network "public_network", bridge: bridge_name
    proxy.vm.hostname = "proxy"
    proxy.hostmanager.enabled = true
	proxy.vm.provision "ansible" do |ansible|
		ansible.playbook = "./ansible/proxy-setup.yml"
	end
  end

  # Node machines configuration
  nodes.each do |node|
    config.vm.define node[:name] do |nodeconfig|
      nodeconfig.vm.box = "centos/7"
      nodeconfig.vm.network "private_network", ip: node[:ip]
	  nodeconfig.vm.network "public_network", bridge: bridge_name
      nodeconfig.vm.hostname = node[:name]
      nodeconfig.hostmanager.enabled = true
	  nodeconfig.vm.provision "ansible" do |ansible|
		ansible.playbook = "./ansible/docker-setup.yml"
	  end
    end
  end
end

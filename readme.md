# Lab-vm setup

## Dependencies

1. Vagrant
2. Vagrant-hostmanager
3. Ansible

## Setup

### Install Vagrant, vagrant-hostmanager and ansible on host workstation.

```bash
apt update
sudo apt-get install Vagrant
vagrant plugin install vagrant-hostmanager

sudo apt-get install ansible
ansible-galaxy collection install community.docker
```

### Setup VirtualBox network

```bash
sudo ./config/vbox-netowrk-setup.sh
```

### Run vagrant

```bash
vagrant up --provision
```

### When vagrant stuck on SSH auth method: private key
```bash
eval `ssh-agent`
kill -9 <id>
```
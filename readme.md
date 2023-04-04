# Lab-vm setup

DevOps Lab is a sample project that demonstrates the use of Vagrant, Ansible, Docker, and Docker Swarm to create a development environment that can be easily replicated across different machines.

The project includes a Vagrantfile that defines the virtual machine and provisions it using Ansible. The Ansible playbook installs Docker and Docker Compose, which are used to manage and deploy the Docker containers. The Vagrantfile also maps the host machine's port to the Docker container's port so that the application can be accessed from the host machine.

Once the virtual machine is up and running, Docker Swarm is used to create a cluster of Docker nodes. The nodes are managed by a Swarm manager and can be easily scaled up or down depending on the demand. The Docker images are built using Dockerfiles and are deployed to the Swarm cluster using Docker Compose.

The DevOps Lab project can be used as a starting point for creating a development environment that can be easily deployed and managed. It demonstrates best practices for using Vagrant, Ansible, Docker, and Docker Swarm and can be customized to fit the needs of different projects.

## Development

### Dependencies

1. Vagrant
2. Vagrant-hostmanager
3. Ansible

### Dev Dependencies

1. ansible-lint
2. python dev

## Setup

### Install Vagrant, vagrant-hostmanager and ansible on host workstation.

```bash
apt update
sudo apt-get install vagrant python3

vagrant plugin install vagrant-hostmanager
ansible-galaxy collection install community.docker

pip3 install ansible
pip3 install ansible-lint
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

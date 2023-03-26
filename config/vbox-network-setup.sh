#!/bin/bash

# Backup original vbox networks.conf
sudo cp /etc/vbox/networks.conf /etc/vbox/networks.conf.bak

# Setup new IP address
sudo echo "* 192.168.50.1/24" >> /etc/vbox/networks.conf

# Show config
cat /etc/vbox/networks.conf
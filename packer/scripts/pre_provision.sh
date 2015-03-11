#!/bin/bash

set -e

# Updating and Upgrading dependencies
sudo apt-get update -y
sudo apt-get upgrade -y

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install software-properties-common wget git curl
sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common

# Install Virtualbox Guest Addon
sudo apt-get -y -q install virtualbox-guest-dkms

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# Install Ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get -y install ansible

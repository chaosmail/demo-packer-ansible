# Packer Demo using Ansible provisioner

Demo project using Packer and Ansible to create and provision an image for Vagrant/Virtualbox

## Getting Started

First, create a new virtualbox base image (Ubuntu 14.04.2 LTS Server amd64) and provision it with running the following command. This command also adds the base image to vagrant.

```
cd packer
./create_box
```

Now, you can launch a vagrant machine from this base image by running the following command.

```
vagrant up
```
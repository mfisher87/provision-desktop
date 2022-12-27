#!/bin/bash
# From: https://raw.githubusercontent.com/lvancrayelynghe/ansible-ubuntu/master/install.sh

###################
# Install ansible #
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible PPA"
    sudo apt-add-repository ppa:ansible/ansible -y
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    sudo apt-get update
    sudo apt-get install software-properties-common ansible git python3-apt -y
else
    echo "Ansible already installed"
fi

if ! (ansible-galaxy collection list | grep slack >/dev/null 2>&1); then
    echo "Installing Ansible modules 'community.general'..."
    ansible-galaxy collection install community.general
else
    echo "Ansible Slack module already installed"
fi


################################
# Display provisioning process #
echo ""
echo "Customize the playbook ansible-desktop.yml to suit your needs, then run ansible with :"
echo "  ansible-playbook ansible-desktop.yml --ask-become-pass"
echo "or use the helper script:"
echo "  "


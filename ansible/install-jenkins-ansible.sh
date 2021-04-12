#!/usr/bin/bash

ansible-playbook -i playbooks/inventory.yml playbooks/install-jenkins.yml
ansible-playbook -i playbooks/inventory.yml playbooks/install-ansible.yml
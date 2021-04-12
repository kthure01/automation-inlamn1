#!/usr/bin/bash

ansible-playbook  -i inventory.yml playbooks/install-jenkins.yml
ansible-playbook  -i inventory.yml playbooks/install-ansible.yml

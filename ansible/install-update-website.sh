#!/usr/bin/bash

ansible-playbook -i playbooks/inventory.yml playbooks/install-lighttpd.yml
ansible-playbook -i playbooks/inventory.yml playbooks/deploy-website.yml
#!/usr/bin/bash

ansible-playbook  -i inventory.yml playbooks/install-lighttpd.yml
ansible-playbook  -i inventory.yml playbooks/deploy-website.yml

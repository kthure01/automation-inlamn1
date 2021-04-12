#!/usr/bin/bash

dir=$(pwd)
ansible-playbook -i $dir/playbooks/inventory.yml $dir/playbooks/install-lighttpd.yml
ansible-playbook -i $dir/playbooks/inventory.yml $dir/playbooks/deploy-website.yml
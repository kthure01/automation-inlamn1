#!/usr/bin/bash

dir=$(dirname $0)
ansible-playbook -i $dir/playbooks/inventory.yml $dir/playbooks/deploy-website.yml
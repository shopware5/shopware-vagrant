#!/bin/bash

ANSIBLE_DIR=$1
ANSIBLE_PLAYBOOK=$2
ANSIBLE_HOSTS=$3
TEMP_HOSTS="/tmp/ansible_hosts"

if [ ! -f $ANSIBLE_PLAYBOOK ]; then
	echo "Cannot find Ansible playbook"
	exit 1
fi

if [ ! -f $ANSIBLE_HOSTS ]; then
	echo "Cannot find Ansible hosts"
	exit 2
fi

if [ ! -d $ANSIBLE_DIR ]; then
	echo "Updating apt cache"
	sudo apt-get update
	echo "Installing Ansible dependencies and Git"
	sudo apt-get install -y git python-yaml python-paramiko python-jinja2
	echo "Cloning Ansible"
	git clone git://github.com/ansible/ansible.git ${ANSIBLE_DIR}
	cd ${ANSIBLE_DIR}
	git checkout v1.7.2
fi

cd ${ANSIBLE_DIR}
cp ${ANSIBLE_HOSTS} ${TEMP_HOSTS} && chmod -x ${TEMP_HOSTS}
echo "Running Ansible"
export PYTHONUNBUFFERED=1
export ANSIBLE_FORCE_COLOR=true
source hacking/env-setup
ansible-playbook -v ${ANSIBLE_PLAYBOOK} --inventory-file=${TEMP_HOSTS} --connection=local
rm ${TEMP_HOSTS}

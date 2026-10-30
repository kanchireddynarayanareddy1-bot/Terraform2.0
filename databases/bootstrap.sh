# #!/bin/bash
# component=$1
# dnf install ansible -y
# ansible-pull -U https://github.com/kanchireddynarayanareddy1-bot/terraform-ansible.git -e component=$component $component.yaml


#!/bin/bash

component=$1
dnf install ansible -y
#ansible-pull -U https://github.com/daws-86s/ansible-roboshop-roles-tf.git -e component=$component main.yaml
# git clone ansible-playbook
# cd ansible-playbook
# ansible-playbook -i inventory main.yaml

REPO_URL=https://github.com/kanchireddynarayanareddy1-bot/terraform-ansible.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=terraform-ansible

mkdir -p $REPO_DIR

cd $REPO_DIR

# check if ansible repo is already cloned or not

if [ -d $ANSIBLE_DIR ]; then

    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -i inventory -e component=$component  $component.yaml
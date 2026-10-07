component=$1
dnf install ansible -y
ansible-pull -U https://github.com/kanchireddynarayanareddy1-bot/terraform-ansible.git -e component=$component $component.yaml

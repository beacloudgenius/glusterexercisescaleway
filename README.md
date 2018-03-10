Prereq:

jq is required locally on the workstation

    sudo apt-get install jq

    eval $(ssh-agent)
    ssh-add ~/.ssh/id_rsa

Build the cluster

edit the `variables.tf` and provide your accesskey and token from scaleway account.

    terraform apply

Check output form terraform and update the inventory file.

    vi inventory

Play ansible like this.

    ansible all -m ping
    ansible all -a "df -h"
    ansible all -a "cat /etc/hosts"
    ansible-playbook hostfile.yml
    ansible all -a "cat /etc/hosts"
    ansible-playbook gluster.yml
    ansible all -a "gluster peer status"
    ansible all -a "gluster volume info"
    ansible all -a "cat /etc/fstab"
    ansible all -a "df -h"

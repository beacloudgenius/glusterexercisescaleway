Prereq:

jq is required locally on the workstation

    sudo apt-get install jq


Play like this.


    ansible all -m ping
    ansible all -a "df -h"
    ansible-playbook hostfile.yml
    ansible all -a "cat /etc/hosts"
    ansible-playbook gluster.yml
    ansible all -a "gluster peer status"
    ansible all -a "gluster volume info"
    ansible all -a "cat /etc/fstab"
    ansible all -a "df -h"

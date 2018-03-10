output "manager_public_ip" {
  value = "${scaleway_server.docker_swarm_manager.public_ip}"
}

output "manager_private_ip" {
  value = "${scaleway_server.docker_swarm_manager.private_ip}"
}

output "worker_0_public_ip" {
  value = "${scaleway_server.docker_swarm_worker.0.public_ip}"
}

output "worker_0_private_ip" {
  value = "${scaleway_server.docker_swarm_worker.0.private_ip}"
}


#    #http://aukjan.vanbelkum.nl/2016/02/23/Ansible-inventory-from-Terraform/
#    #https://github.com/aukjan/terraform-playground/tree/master/ansible/hosts

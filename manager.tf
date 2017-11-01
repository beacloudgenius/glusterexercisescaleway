resource "scaleway_ip" "docker_swarm_manager_ip" {
  server = "${scaleway_server.docker_swarm_manager.id}"
}

resource "scaleway_server" "docker_swarm_manager" {
  name = "docker-swarm-manager"
  image               = "${data.scaleway_image.mychoice.id}"
  dynamic_ip_required = "${var.dynamic_ip}"
  type                = "${var.scaleway_machine_type}"
  bootscript          = "${data.scaleway_bootscript.latest.id}"
  security_group      = "${scaleway_security_group.docker_swarm.id}"

  volume {
    size_in_gb = 50
    type       = "l_ssd"
  }
  provisioner "remote-exec" {
    script = "mount-disk.sh"
  }

  connection {
    user = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    script = "install-docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "docker swarm init --advertise-addr ${scaleway_server.docker_swarm_manager.private_ip}"
    ]
  }



              provisioner "remote-exec" {
                inline = [
                  "apt-get install -y nfs-kernel-server nfs-common",
                  "mkdir /mnt/gluster",
                  "chown nobody:nogroup /mnt/gluster",
                  "chmod 755 /mnt/gluster",
                  "echo '/mnt/gluster   ${self.private_ip}/16(rw,no_root_squash,sync,no_subtree_check)' >> /etc/exports",
                  "chmod -R o+w /mnt/gluster/",
                  "service nfs-kernel-server restart",
                ]
              }


  provisioner "remote-exec" {
    inline = [
      "mkdir -p /mnt/gluster/stacks/acme"
    ]
  }

}

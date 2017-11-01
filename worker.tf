resource "scaleway_server" "docker_swarm_worker" {
  count = "${var.worker_count}"
  name = "docker-swarm-worker-${count.index}"
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

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /etc/systemd/system/docker.service.d",
    ]
  }


  provisioner "remote-exec" {
    script = "install-docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "docker swarm join --token ${data.external.swarm_join_token.result.worker} ${scaleway_server.docker_swarm_manager.private_ip}:2377"
    ]
  }




            provisioner "remote-exec" {
              inline = [
                "mkdir /mnt/gluster",
                "apt install -y nfs-common",
                "echo '${scaleway_server.docker_swarm_manager.private_ip}:/mnt/gluster /mnt/gluster  nfs      auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0'   >> /etc/fstab",
                "mount -a",
              ]
            }



}

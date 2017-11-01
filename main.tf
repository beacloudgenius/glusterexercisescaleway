data "scaleway_image" "mychoice" {
  architecture = "x86_64"
  name         = "Debian Stretch"
}

data "scaleway_bootscript" "latest" {
  architecture = "x86_64"
  name_filter  = "x86_64 mainline 4.13"
}

data "external" "swarm_join_token" {
  program = ["./get-join-tokens.sh"]
  query = {
    host = "${scaleway_server.docker_swarm_manager.public_ip}"
  }
}

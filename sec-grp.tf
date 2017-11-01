resource "scaleway_security_group" "docker_swarm" {
  name        = "docker_swarm"
  description = "Allow selected ports"
}

resource "scaleway_security_group_rule" "ssh_accept" {
  security_group = "${scaleway_security_group.docker_swarm.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 22
}

resource "scaleway_security_group_rule" "http_accept" {
  security_group = "${scaleway_security_group.docker_swarm.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 80
}

resource "scaleway_security_group_rule" "https_accept" {
  security_group = "${scaleway_security_group.docker_swarm.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 443
}

resource "scaleway_security_group_rule" "rtmp_accept" {
  security_group = "${scaleway_security_group.docker_swarm.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 1935
}

resource "scaleway_security_group_rule" "ovpn_accept" {
  security_group = "${scaleway_security_group.docker_swarm.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "UDP"
  port      = 1194
}

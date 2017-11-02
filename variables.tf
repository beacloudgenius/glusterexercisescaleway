provider "scaleway" {
  organization = "REPLACETHIS"
  token        = "REPLACETHIS"
  region       = "par1"
}

variable "dynamic_ip" {
  description = "Enable or disable server dynamic public ip"
  default = "true"
}

variable "scaleway_machine_type" {
  description = "Instance type for machines"
  default = "C2S"
}

variable "worker_count" {
  description = "number of swarm workers"
  default = 2
}

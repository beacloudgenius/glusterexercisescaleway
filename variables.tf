provider "scaleway" {
  organization = "8b1331e2-4d22-4706-954f-9253e1959984"
  token        = "6ad9dbc4-fadd-4836-b86c-ca6044ef9803"
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

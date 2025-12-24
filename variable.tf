# Project & location
variable "project_id" {
  type = string
}

variable "region" {
  default = "us-central1"
  type    = string
}

variable "zone" {
  default = "us-central1-a"
  type    = string
}

#vm configuration

variable "vm_machine_type" {
  type    = string
  default = "e2-micro"
}

variable "vm_disk_size" {
  type    = number
  default = 15
}
variable "vm_image" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}

# network
variable "vpc_name" {
  type    = string
  default = "salt-training"
}

variable "subnet_name" {
  type    = string
  default = "salt-subnet"
}

# ssh

variable "ssh_user" {
  type    = string
  default = "vishal"
}
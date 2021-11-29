locals {
  ec2s = yamldecode(file(var.ec2s))
}

variable "ec2s" {
    type = any
    default = "./ec2s.yml"
}

variable "deploy_vpc" {
  type = string
}

variable "deploy_subnet" {
  type = string
}
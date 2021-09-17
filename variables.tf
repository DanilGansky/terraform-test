# Common
variable "environment" {
  default = "development"
}

variable "region" {
  default = "eu-central-1"
}

variable "common_tags" {
  type = map(string)
  default = {
    Environment = "development"
    Author      = "MiceOnMars"
  }
}

# VPC
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_a_cidr_block" {
  default = "10.0.11.0/24"
}

variable "public_subnet_b_cidr_block" {
  default = "10.0.21.0/24"
}

variable "private_subnet_a_cidr_block" {
  default = "10.0.12.0/24"
}

variable "private_subnet_b_cidr_block" {
  default = "10.0.22.0/24"
}

# EC2
variable "instance_type" {
  default = "t2.micro"
}

variable "template_data" {
  type = map(string)
  default = {
    "instance_name" = "webserver"
    "author"        = "MiceOnMars"
  }
}

variable "template_name" {
  default = "user_data.tpl"
}

variable "allowed_ports" {
  type    = list(string)
  default = ["80", "443"]
}
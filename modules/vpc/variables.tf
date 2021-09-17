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
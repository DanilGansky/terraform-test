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

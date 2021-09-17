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
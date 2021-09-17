provider "aws" {
  region = var.region
}

resource "aws_key_pair" "webserver_key" {
  key_name   = "webserver-key"
  public_key = file("./ssh_rsa.pub")
}
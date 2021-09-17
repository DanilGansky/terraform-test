# VPC
resource "aws_vpc" "webserver_vpc" {
  cidr_block = "10.10.10.0/16"

  tags = {
    Name = "webserver-vpc"
    Type = "prod"
  }
}

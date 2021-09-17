# VPC
resource "aws_vpc" "webserver_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = merge(module.variables.common_tags, {
    Name = "webserver-vpc"
  })
}

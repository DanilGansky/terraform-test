# Public Subnets
resource "aws_subnet" "webserver_public_subnet_a" {
  cidr_block              = var.public_subnet_a_cidr_block
  vpc_id                  = aws_vpc.webserver_vpc.id
  availability_zone_id    = data.aws_availability_zones.available[0]
  map_public_ip_on_launch = true

  tags = merge(module.variables.common_tags, {
    Name = "webserver-public-subnet-a"
  })
}

resource "aws_subnet" "webserver_public_subnet_b" {
  cidr_block              = var.public_subnet_b_cidr_block
  vpc_id                  = aws_vpc.webserver_vpc.id
  availability_zone_id    = data.aws_availability_zones.available[1]
  map_public_ip_on_launch = true

  tags = merge(module.variables.common_tags, {
    Name = "webserver-public-subnet-b"
  })
}

# Private Subnets
resource "aws_subnet" "webserver_private_subnet_a" {
  cidr_block           = var.private_subnet_a_cidr_block
  vpc_id               = aws_vpc.webserver_vpc.id
  availability_zone_id = data.aws_availability_zones.available[0]

  tags = merge(module.variables.common_tags, {
    Name = "webserver-private-subnet-a"
  })
}

resource "aws_subnet" "webserver_private_subnet_b" {
  cidr_block           = var.private_subnet_b_cidr_block
  vpc_id               = aws_vpc.webserver_vpc.id
  availability_zone_id = data.aws_availability_zones.available[1]

  tags = merge(module.variables.common_tags, {
    Name = "webserver-private-subnet-b"
  })
}

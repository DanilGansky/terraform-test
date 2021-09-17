# VPC
resource "aws_vpc" "webserver_vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = merge(var.common_tags, { Name = "webserver-vpc" })
}

# Public Subnets
resource "aws_subnet" "webserver_public_subnet_a" {
  cidr_block              = var.public_subnet_a_cidr_block
  vpc_id                  = aws_vpc.webserver_vpc.id
  availability_zone_id    = data.aws_availability_zones.available.zone_ids[0]
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, { Name = "webserver-public-subnet-a" })
}

resource "aws_subnet" "webserver_public_subnet_b" {
  cidr_block              = var.public_subnet_b_cidr_block
  vpc_id                  = aws_vpc.webserver_vpc.id
  availability_zone_id    = data.aws_availability_zones.available.zone_ids[1]
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, { Name = "webserver-public-subnet-b" })
}

# Private Subnets
resource "aws_subnet" "webserver_private_subnet_a" {
  cidr_block           = var.private_subnet_a_cidr_block
  vpc_id               = aws_vpc.webserver_vpc.id
  availability_zone_id = data.aws_availability_zones.available.zone_ids[0]
  tags                 = merge(var.common_tags, { Name = "webserver-private-subnet-a" })
}

resource "aws_subnet" "webserver_private_subnet_b" {
  cidr_block           = var.private_subnet_b_cidr_block
  vpc_id               = aws_vpc.webserver_vpc.id
  availability_zone_id = data.aws_availability_zones.available.zone_ids[1]
  tags                 = merge(var.common_tags, { Name = "webserver-private-subnet-b" })
}

# Internet Gateway
resource "aws_internet_gateway" "webserver_igw" {
  vpc_id = aws_vpc.webserver_vpc.id
  tags   = merge(var.common_tags, { Name = "webserver-igw" })
}

# Route Table for Public Subnets
resource "aws_route_table" "webserver_public_subnets_route_table" {
  vpc_id = aws_vpc.webserver_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.webserver_igw.id
  }

  tags = merge(var.common_tags, { Name = "webserver-public-subnets-route-table" })
}

# Route Table for Private Subnets
resource "aws_route_table" "webserver_private_subnets_route_table" {
  vpc_id = aws_vpc.webserver_vpc.id

  #  // todo: attach NAT gateway
  #  route {
  #    cidr_block = "0.0.0.0/0"
  #    gateway_id = "nat gateway"
  #  }

  tags = merge(var.common_tags, { Name = "webserver-private-subnets-route-table" })
}

# Route Table Associations with Public Subnets
resource "aws_route_table_association" "webserver_public_subnet_a_route_table_association" {
  route_table_id = aws_route_table.webserver_public_subnets_route_table.id
  subnet_id      = aws_subnet.webserver_public_subnet_a.id
}

resource "aws_route_table_association" "webserver_public_subnet_b_route_table_association" {
  route_table_id = aws_route_table.webserver_public_subnets_route_table.id
  subnet_id      = aws_subnet.webserver_public_subnet_b.id
}


# Route Table Associations with Private Subnets
resource "aws_route_table_association" "webserver_private_subnet_a_route_table_association" {
  route_table_id = aws_route_table.webserver_private_subnets_route_table.id
  subnet_id      = aws_subnet.webserver_private_subnet_a.id
}

resource "aws_route_table_association" "webserver_private_subnet_b_route_table_association" {
  route_table_id = aws_route_table.webserver_private_subnets_route_table.id
  subnet_id      = aws_subnet.webserver_private_subnet_b.id
}

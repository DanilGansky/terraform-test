# Public Subnets
resource "aws_subnet" "webserver_public_subnet_a" {
  cidr_block              = "10.0.11.0/24"
  vpc_id                  = aws_vpc.webserver_vpc.id
  availability_zone_id    = data.aws_availability_zones.available[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "webserver-public-subnet-a"
  }
}

resource "aws_subnet" "webserver_public_subnet_b" {
  cidr_block              = "10.0.21.0/24"
  vpc_id                  = aws_vpc.webserver_vpc.id
  availability_zone_id    = data.aws_availability_zones.available[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "webserver-public-subnet-b"
  }
}

# Private Subnets
resource "aws_subnet" "webserver_private_subnet_a" {
  cidr_block           = "10.0.12.0/24"
  vpc_id               = aws_vpc.webserver_vpc.id
  availability_zone_id = data.aws_availability_zones.available[0]

  tags = {
    Name = "webserver-private-subnet-a"
  }
}

resource "aws_subnet" "webserver_private_subnet_b" {
  cidr_block           = "10.0.22.0/24"
  vpc_id               = aws_vpc.webserver_vpc.id
  availability_zone_id = data.aws_availability_zones.available[1]

  tags = {
    Name = "webserver-private-subnet-b"
  }
}

# Database Subnets
resource "aws_subnet" "webserver_db_subnet_a" {
  cidr_block           = "10.0.13.0/24"
  vpc_id               = aws_vpc.webserver_vpc.id
  availability_zone_id = data.aws_availability_zones.available[0]

  tags = {
    Name = "webserver-db-subnet-a"
  }
}

resource "aws_subnet" "webserver_db_subnet_b" {
  cidr_block           = "10.0.23.0/24"
  vpc_id               = aws_vpc.webserver_vpc.id
  availability_zone_id = data.aws_availability_zones.available[1]

  tags = {
    Name = "webserver-db-subnet-b"
  }
}
# Route Table for Private Subnets
// todo: attach NAT gateway
resource "aws_route_table" "webserver_private_subnets_route_table" {
  vpc_id = aws_vpc.webserver_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "nat gateway"
  }

  tags = {
    Name = "webserver-private-subnets-route-table"
  }
}

# Route Table for Database Subnets
resource "aws_route_table" "webserver_db_subnets_route_table" {
  vpc_id = aws_vpc.webserver_vpc.id
  tags = {
    Name = "webserver-db-subnets-route-table"
  }
}
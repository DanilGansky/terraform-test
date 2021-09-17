# Route Table for Private Subnets
resource "aws_route_table" "webserver_private_subnets_route_table" {
  vpc_id = aws_vpc.webserver_vpc.id

  // todo: attach NAT gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "nat gateway"
  }

  tags = merge(module.variables.common_tags, {
    Name = "webserver-private-subnets-route-table"
  })
}

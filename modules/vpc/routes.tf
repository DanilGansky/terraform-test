# Routes for Public Subnets
resource "aws_route" "webserver_public_subnet_a_igw_route" {
  route_table_id         = data.aws_route_table.webserver_public_subnet_a_route-table
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.webserver_igw.id
}

resource "aws_route" "webserver_public_subnet_b_igw_route" {
  route_table_id         = data.aws_route_table.webserver_public_subnet_b_route-table
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.webserver_igw.id
}
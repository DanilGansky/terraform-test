# Route Table Associations with Private Subnets
resource "aws_route_table_association" "webserver_private_subnet_a_route_table_association" {
  route_table_id = aws_route_table.webserver_private_subnets_route_table.id
  subnet_id      = aws_subnet.webserver_private_subnet_a.id
}

resource "aws_route_table_association" "webserver_private_subnet_b_route_table_association" {
  route_table_id = aws_route_table.webserver_private_subnets_route_table.id
  subnet_id      = aws_subnet.webserver_private_subnet_b.id
}

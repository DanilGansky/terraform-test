# Availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Exiting route tables for Public Subnets
data "aws_route_table" "webserver_public_subnet_a_route-table" {
  subnet_id = aws_subnet.webserver_public_subnet_a.id
}

data "aws_route_table" "webserver_public_subnet_b_route-table" {
  subnet_id = aws_subnet.webserver_public_subnet_b.id
}
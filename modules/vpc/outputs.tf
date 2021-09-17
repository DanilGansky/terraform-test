# VPC ID
output "webserver_vpc_id" {
  value = aws_vpc.webserver_vpc.id
}

# Public Subnets IDs
output "webserver_public_subnet_a_id" {
  value = aws_subnet.webserver_public_subnet_a.id
}

output "webserver_public_subnet_b_id" {
  value = aws_subnet.webserver_public_subnet_b.id
}

# Private Subnets IDs
output "webserver_private_subnet_a_id" {
  value = aws_subnet.webserver_private_subnet_a.id
}

output "webserver_private_subnet_b_id" {
  value = aws_subnet.webserver_private_subnet_b.id
}
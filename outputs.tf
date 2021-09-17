data "aws_region" "current" {}

data "aws_vpc" "prod" {
  tags = {
    Type = "Prod"
  }
}

output "my_webserver_webserver_instance_id" {
  value = aws_instance.my_webserver.id
}

output "my_webserver_webserver_db_instance_id" {
  value = aws_instance.my_webserver_db.id
}

output "my_webserver_sg_id" {
  value = aws_security_group.my_webserver_linux_sg.id
}

output "my_webserver_public_ip" {
  value = aws_eip.my_webserver_eip.public_ip
}

output "my_webserver_public_subnet_id" {
  value = aws_subnet.webserver_public_subnet.id
}

output "my_webserver_public_subnet_zone" {
  value = aws_subnet.webserver_public_subnet.availability_zone
}

output "my_webserver_private_subnet_id" {
  value = aws_subnet.webserver_private_subnet.id
}

output "my_webserver_private_subnet_zone" {
  value = aws_subnet.webserver_private_subnet.availability_zone
}

output "data_current_region_name" {
  value = data.aws_region.current.name
}

output "data_current_region_description" {
  value = data.aws_region.current.description
}

output "data_current_prod_vpc" {
  value = data.aws_vpc.prod.id
}
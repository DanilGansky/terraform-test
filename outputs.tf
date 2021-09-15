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
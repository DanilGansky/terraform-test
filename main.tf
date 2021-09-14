provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_webserver" {
    instance_type          = "t2.micro"
    ami                    = "ami-07df274a488ca9195"
    user_data              = templatefile("user_data.tpl", {
      instance_name = "MyWebserver"
    })

    vpc_security_group_ids = [ aws_security_group.my_webserver_linux_sg.id ]

    tags = {
      "Name" = "MyWebserver"
    }
}

resource "aws_security_group" "my_webserver_linux_sg" {
  name = "my_webserver_linux_sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
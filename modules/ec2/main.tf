# WebServer EC2 Instances
resource "aws_instance" "my_webserver" {
  instance_type = "t2.micro"
  ami           = "ami-07df274a488ca9195"
  subnet_id     = aws_subnet.webserver_public_subnet.id

  user_data = templatefile("user_data.tpl", {
    instance_name = "MyWebserver",
    author        = "MiceOnMars"
  })

  vpc_security_group_ids = [aws_security_group.my_webserver_linux_sg.id]
  depends_on             = [aws_instance.my_webserver_db]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = "MyWebserver"
  }
}

resource "aws_instance" "my_webserver_db" {
  instance_type = "t2.micro"
  ami           = "ami-07df274a488ca9195"
  subnet_id     = module.webserver_vpc.webserver_private_subnet.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = "MyWebserverDB"
  }
}

resource "aws_eip" "my_webserver_eip" {
  instance = aws_instance.my_webserver.id
}

resource "aws_security_group" "my_webserver_linux_sg" {
  name = "my_webserver_linux_sg"

  dynamic "ingress" {
    for_each = ["80", "443", "8080"]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["77.93.44.206/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
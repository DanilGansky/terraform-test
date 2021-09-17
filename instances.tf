# WebServer EC2 Instances
resource "aws_instance" "webserver" {
  instance_type = var.instance_type
  ami           = data.aws_ami.latest_linux_ami.id
  subnet_id     = aws_subnet.webserver_public_subnet_a.id
  key_name      = aws_key_pair.webserver_key.key_name

  user_data = templatefile(var.template_name, var.template_data)
  tags      = merge(var.common_tags, { Name = "webserver" })

  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  depends_on             = [aws_instance.webserver_db]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "webserver_db" {
  instance_type = var.instance_type
  ami           = data.aws_ami.latest_linux_ami.id
  subnet_id     = aws_subnet.webserver_private_subnet_a.id
  key_name      = aws_key_pair.webserver_key.key_name

  vpc_security_group_ids = [aws_security_group.webserver_db_sg.id]
  tags                   = merge(var.common_tags, { Name = "webserver-db" })

  lifecycle {
    create_before_destroy = true
  }
}

# AWS Elastic IP
resource "aws_eip" "webserver_eip" {
  instance = aws_instance.webserver.id
  tags     = merge(var.common_tags, { Name = "webserver-eip" })
}

# AWS Security groups
# For webserver
resource "aws_security_group" "webserver_sg" {
  vpc_id = aws_vpc.webserver_vpc.id
  name   = "webserver-sg"
  tags   = merge(var.common_tags, { Name = "webserver-sg" })

  dynamic "ingress" {
    for_each = var.allowed_ports
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
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# For DB
resource "aws_security_group" "webserver_db_sg" {
  vpc_id = aws_vpc.webserver_vpc.id
  name   = "webserver-db-sg"
  tags   = merge(var.common_tags, { Name = "webserver-db-sg" })

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
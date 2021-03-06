# VPC
# Availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# EC2
# Latest Amazon Linux AMI
data "aws_ami" "latest_linux_ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-ebs"]
  }
}
# Internet Gateway
resource "aws_internet_gateway" "webserver_igw" {
  vpc_id = aws_vpc.webserver_vpc.id
  tags = {
    Name = "webserver-igw"
  }
}
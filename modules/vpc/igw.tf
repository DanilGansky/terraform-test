# Internet Gateway
resource "aws_internet_gateway" "webserver_igw" {
  vpc_id = aws_vpc.webserver_vpc.id
  tags = merge(module.variables.common_tags, {
    Name = "webserver-igw"
  })
}
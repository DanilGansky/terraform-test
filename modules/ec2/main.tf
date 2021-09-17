resource "aws_key_pair" "webserver_key" {
  key_name   = "webserver-key"
  public_key = file("../../frankfurt-key.pem")
}
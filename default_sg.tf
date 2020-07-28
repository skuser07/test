resource "aws_default_security_group" "user07_dev_default" {
  vpc_id = aws_vpc.user07_dev.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "user07_dev-default"
  }
}
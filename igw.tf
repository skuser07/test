resource "aws_internet_gateway" "user07_dev" {
  vpc_id = aws_vpc.user07_dev.id

  tags = {
    Name = "user07_dev"
  }
}
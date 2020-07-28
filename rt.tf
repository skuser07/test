resource "aws_route_table" "user07_dev_public" {
  vpc_id = aws_vpc.user07_dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.user07_dev.id
  }

  tags = {
    Name = "user07_dev-public"
  }
}

resource "aws_route_table_association" "user07_dev_public_1a" {
  subnet_id      = aws_subnet.user07_public_1a.id
  route_table_id = aws_route_table.user07_dev_public.id
}

resource "aws_route_table_association" "user07_dev_public_1c" {
  subnet_id      = aws_subnet.user07_public_1c.id
  route_table_id = aws_route_table.user07_dev_public.id
}
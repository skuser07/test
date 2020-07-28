resource "aws_subnet" "user07_public_1a" {
  vpc_id            = aws_vpc.user07_dev.id
  ## vpc_id            = "vpc-026af350fc64456e3"  // 직접 VPC ID로 넣어도 동작
  availability_zone = "ap-northeast-1a"
  cidr_block        = "7.0.1.0/24"

  tags  = {
    Name = "user07_public-1a"
  }
}


resource "aws_subnet" "user07_public_1c" {
  vpc_id            = aws_vpc.user07_dev.id
  availability_zone = "ap-northeast-1c"
  cidr_block        = "7.0.2.0/24"

  tags  = {
    Name = "user07_public-1c"
  }
}
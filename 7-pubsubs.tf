resource "aws_subnet" "pub-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.10.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az[0]
}
resource "aws_subnet" "pub-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.10.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az[1]
}
resource "aws_subnet" "pub-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.10.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = var.az[2]
}
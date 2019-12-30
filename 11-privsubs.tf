resource "aws_subnet" "priv-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.priv-cidr[0]
  map_public_ip_on_launch = false
  availability_zone = var.az[0]
}
resource "aws_subnet" "priv-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.priv-cidr[1]
  map_public_ip_on_launch = false
  availability_zone = var.az[1]
}
resource "aws_subnet" "priv-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.priv-cidr[2]
  map_public_ip_on_launch = false
  availability_zone = var.az[2]
}
resource "aws_subnet" "priv-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.10.11.0/24"
  map_public_ip_on_launch = false
  availability_zone = var.az[0]
}
resource "aws_subnet" "priv-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.10.12.0/24"
  map_public_ip_on_launch = false
  availability_zone = var.az[1]
}
resource "aws_subnet" "priv-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.10.13.0/24"
  map_public_ip_on_launch = false
  availability_zone = var.az[2]
}
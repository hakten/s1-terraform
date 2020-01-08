resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc-cidr
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.environment}-${var.vpc-name}"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "public-subnet" {
  
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub-cidr[0]
  map_public_ip_on_launch = true
  availability_zone = var.az[0]
  tags = {
    Name = "pub-1"
  }
}

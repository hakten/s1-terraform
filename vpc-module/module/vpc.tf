resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.Environment}-${var.name}"
    Environment = "${var.Environment}"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = "${length(var.azs)}"
  availability_zone       = "${element(var.azs,count.index)}"
  cidr_block              = "${element(var.public_subnets,count.index)}"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "pub-1"
  }
}

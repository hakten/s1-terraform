resource "aws_vpc" "vpc" {
  cidr_block       = "${var.cidr}"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.Environment}-${var.name}"
    Environment = "${var.Environment}"
  }
}

resource "aws_subnet" "public-subnets" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  count                   = "${length(var.azs)}"
  availability_zone       = "${element(var.azs,count.index)}"
  cidr_block              = "${element(var.public_subnets,count.index)}"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "${var.Environment}-Public-Subnet-${count.index+1}"
  }
}

resource "aws_subnet" "private-subnets" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  count                   = "${length(var.azs)}"
  availability_zone       = "${element(var.azs,count.index)}"
  cidr_block              = "${element(var.private_subnets,count.index)}"
  map_public_ip_on_launch = false
  
  tags = {
    Name = "${var.Environment}-Private-Subnet-${count.index+1}"
  }
}
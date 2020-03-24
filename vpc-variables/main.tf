variable "cidr_block" {
  default = "10.0.0.0"
  description = "Cidr block of the vpc."
}

variable "vpc_name" {
  default = "main_vpc"
}

variable "public_subnet" {
  default = ["10.0.0.1","10.0.0.2","10.0.0.3"]
}

variable "az" {
  default= ["eu-west-1a","eu-west-1b","eu-west-1c"]
}



provider "aws" {
  region = "eu-west-1"
}


resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "public_subnet" {
  count                      = 3
  vpc_id                     = "${aws_vpc.vpc.id}"
  cidr_block                 = "${var.public_subnet.[0]}"
  availability_zone          = "${var.az.[0]}"
  map_public_ip_on_launch    = true


  tags = {
    Name = "public_subnet"
  }
}

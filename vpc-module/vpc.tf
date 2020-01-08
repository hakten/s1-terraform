resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc-cidr
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.environment}-${var.vpc-name}"
    Environment = "${var.environment}"
  }
}

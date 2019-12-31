output "vpc-id" {
  value = aws_vpc.vpc.name
}
output "vpc-cidr-block" {
  value = aws_vpc.vpc.cidr_block
}

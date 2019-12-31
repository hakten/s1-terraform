resource "aws_nat_gateway" "nat" {
  subnet_id     = aws_subnet.pub-1.id
  allocation_id = aws_eip.eip.id
}

resource "aws_eip" "eip" {
  vpc      = true
}

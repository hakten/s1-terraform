resource "aws_route_table_association" "pub-1" {
  route_table_id = aws_vpc.vpc.main_route_table_id
  subnet_id      = aws_subnet.pub-1.id
}
resource "aws_route_table_association" "pub-2" {
  route_table_id = aws_vpc.vpc.main_route_table_id
  subnet_id      = aws_subnet.pub-2.id
}
resource "aws_route_table_association" "pub-3" {
  route_table_id = aws_vpc.vpc.main_route_table_id
  subnet_id      = aws_subnet.pub-3.id
}

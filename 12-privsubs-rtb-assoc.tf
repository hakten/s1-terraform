resource "aws_route_table_association" "priv-1" {
  route_table_id = aws_route_table.priv-rtb.id
  subnet_id      = aws_subnet.priv-1.id
}
resource "aws_route_table_association" "priv-2" {
  route_table_id = aws_route_table.priv-rtb.id
  subnet_id      = aws_subnet.priv-2.id
}
resource "aws_route_table_association" "priv-3" {
  route_table_id = aws_route_table.priv-rtb.id
  subnet_id      = aws_subnet.priv-3.id
}

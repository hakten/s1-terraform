resource "aws_instance" "mysql" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id = aws_subnet.priv-1.id
  associate_public_ip_address = "false"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.db.id]

  user_data = file("userdata-db")
  tags = {
    Name = "Database"
  }
}
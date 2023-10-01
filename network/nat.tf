# Creating the EIP for the NAT Gateway
resource "aws_eip" "my_eip" {
  tags = {
    Name = "eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "nat-gw"
  }

}


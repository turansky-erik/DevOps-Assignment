
#8 ; NAT internet GW



resource "aws_eip" "nat_eip" {
  domain = "vpc"
  depends_on 	= [aws_internet_gateway.myIgw]
}


resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.PublicSubnet.id
  tags = {
    "Name" = "MyVPC_NatGateway"
  }
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.MyVPC.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
}


resource "aws_route_table_association" "private"{
    subnet_id = aws_subnet.PrivSubnet.id
    route_table_id = aws_route_table.private_rt.id
}

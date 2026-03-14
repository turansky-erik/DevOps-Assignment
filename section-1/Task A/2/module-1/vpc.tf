# 1 : Create a VPC


resource "aws_vpc" "MyVPC"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "MyVPC"
    }
}

# 2: Create a public subnet
resource "aws_subnet" "PublicSubnet"{
    vpc_id = aws_vpc.MyVPC.id
		availability_zone = "eu-central-1a"
		cidr_block = "10.0.0.0/24"
		map_public_ip_on_launch = "true"
}

# 3 : create a private subnet
resource "aws_subnet" "PrivSubnet"{
    vpc_id = aws_vpc.MyVPC.id
		cidr_block = "10.0.1.0/24"
		availability_zone = "eu-central-1b"
		map_public_ip_on_launch = "false"

}


#4 : create IGW
resource "aws_internet_gateway" "myIgw"{
    vpc_id = aws_vpc.MyVPC.id
}

# 5 : route Tables for public subnet
resource "aws_route_table" "PublicRT"{
    vpc_id = aws_vpc.MyVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myIgw.id
    }
}
 

 #7 : route table association public subnet 
resource "aws_route_table_association" "PublicRTAssociation"{
    subnet_id = aws_subnet.PublicSubnet.id
    route_table_id = aws_route_table.PublicRT.id
}


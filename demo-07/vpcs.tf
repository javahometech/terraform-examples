resource "aws_vpc" "main" {
  cidr_block = "${var.AWS_VPC_CIDIR}"
  tags{
    Name = "JavaHomeVPC"
  }
}

resource "aws_internet_gateway" "javahomeigw" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "JavaHomeIGW"
  }
}

# Create route table and add route to IGW

resource "aws_route_table" "public1rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.javahomeigw.id}"
  }

  tags {
    Name = "PublicSubnetsRouteTable"
  }
}

# Associate route table with subnet

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public-1.id}"
  route_table_id = "${aws_route_table.public1rt.id}"
}

resource "aws_eip" "elasticip" {
  vpc      = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.elasticip.id}"
  subnet_id     = "${aws_subnet.public-1.id}"
}

resource "aws_route" "route_with_nat_gateway" {
  route_table_id            = "rtb-a83178ce"
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = "${aws_nat_gateway.gw.id}"
}
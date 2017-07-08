resource "aws_subnet" "public-1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PUBLIC1_CIDR}"

  tags {
    Name = "PublicSubnet-1"
  }
}

resource "aws_subnet" "private-1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PRIVATE1_CIDR}"

  tags {
    Name = "PrivateSubnet-1"
  }
}
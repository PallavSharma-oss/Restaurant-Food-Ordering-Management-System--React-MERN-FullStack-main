#############################################
# Private Route Table
#############################################

resource "aws_route_table" "private_rt" {

  vpc_id = aws_vpc.main_vpc.id

  route {

    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat_gateway.id

  }

  tags = {
    Name = "${var.project_name}-private-route-table"
  }
}

#############################################
# Private Subnet 1 Association
#############################################

resource "aws_route_table_association" "private_assoc_1" {

  subnet_id = aws_subnet.private_subnet_1.id

  route_table_id = aws_route_table.private_rt.id

}

#############################################
# Private Subnet 2 Association
#############################################

resource "aws_route_table_association" "private_assoc_2" {

  subnet_id = aws_subnet.private_subnet_2.id

  route_table_id = aws_route_table.private_rt.id

}
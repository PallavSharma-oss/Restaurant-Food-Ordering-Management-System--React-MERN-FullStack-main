#############################################
# Public Subnet 1
#############################################

resource "aws_subnet" "public_subnet_1" {

  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = var.availability_zone_1

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-1"
  }
}

#############################################
# Public Subnet 2
#############################################

resource "aws_subnet" "public_subnet_2" {

  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = var.availability_zone_2

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-2"
  }
}

#############################################
# Private Subnet 1
#############################################

resource "aws_subnet" "private_subnet_1" {

  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = var.availability_zone_1

  tags = {
    Name = "${var.project_name}-private-subnet-1"
  }
}

#############################################
# Private Subnet 2
#############################################

resource "aws_subnet" "private_subnet_2" {

  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = var.availability_zone_2

  tags = {
    Name = "${var.project_name}-private-subnet-2"
  }
}
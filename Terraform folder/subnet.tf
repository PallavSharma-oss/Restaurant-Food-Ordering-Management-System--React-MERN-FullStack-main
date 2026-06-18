# =====================================
# Public Subnet
# =====================================

resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.public_subnet_cidr

  availability_zone = var.availability_zone

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-Public-Subnet"
  }
}

# =====================================
# Private Subnet
# =====================================

resource "aws_subnet" "private_subnet" {

  vpc_id = aws_vpc.main_vpc.id

  cidr_block = var.private_subnet_cidr

  availability_zone = var.availability_zone

  tags = {
    Name = "${var.project_name}-Private-Subnet"
  }
}
# =====================================
# Frontend EC2
# =====================================

resource "aws_instance" "frontend" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [aws_security_group.frontend_sg.id]

  key_name = aws_key_pair.deployer_key.key_name

  associate_public_ip_address = true

  user_data = file("${path.module}/user-data/frontend.sh")

  tags = {
    Name = "${var.project_name}-Frontend"
  }
}

# =====================================
# Backend EC2
# =====================================

resource "aws_instance" "backend" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [aws_security_group.backend_sg.id]

  key_name = aws_key_pair.deployer_key.key_name

  user_data = file("${path.module}/user-data/backend.sh")

  tags = {
    Name = "${var.project_name}-Backend"
  }
}

# =====================================
# MongoDB EC2
# =====================================

resource "aws_instance" "mongodb" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_subnet.id

  vpc_security_group_ids = [aws_security_group.mongodb_sg.id]

  key_name = aws_key_pair.deployer_key.key_name

  tags = {
    Name = "${var.project_name}-MongoDB"
  }
}
# =====================================
# Generate Private/Public Key
# =====================================

resource "tls_private_key" "terraform_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# =====================================
# Save PEM File Locally
# =====================================

resource "local_file" "private_key" {
  content         = tls_private_key.terraform_key.private_key_pem
  filename        = "food-ordering-key.pem"
  file_permission = "0400"
}

# =====================================
# AWS Key Pair
# =====================================

resource "aws_key_pair" "deployer_key" {
  key_name   = "${var.project_name}-key"
  public_key = tls_private_key.terraform_key.public_key_openssh
}
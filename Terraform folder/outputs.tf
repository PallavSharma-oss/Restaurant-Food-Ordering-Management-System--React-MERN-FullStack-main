# =====================================
# VPC
# =====================================

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

# =====================================
# Frontend
# =====================================

output "frontend_public_ip" {
  value = aws_instance.frontend.public_ip
}

output "frontend_private_ip" {
  value = aws_instance.frontend.private_ip
}

# =====================================
# Backend
# =====================================

output "backend_public_ip" {
  value = aws_instance.backend.public_ip
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}

# =====================================
# MongoDB
# =====================================

output "mongodb_private_ip" {
  value = aws_instance.mongodb.private_ip
}
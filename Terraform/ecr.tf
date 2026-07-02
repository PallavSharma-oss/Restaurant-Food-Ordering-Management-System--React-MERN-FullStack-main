############################################
# Frontend ECR Repository
############################################

resource "aws_ecr_repository" "frontend" {
  name                 = "restaurant-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "restaurant-frontend"
  }
}

############################################
# Backend ECR Repository
############################################

resource "aws_ecr_repository" "backend" {
  name                 = "restaurant-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "restaurant-backend"
  }
}
############################################
# ECS Cluster
############################################

resource "aws_ecs_cluster" "restaurant_cluster" {
  name = "restaurant-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "restaurant-cluster"
  }
}
#############################################################
# VPC
#############################################################

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

#############################################################
# ECS Cluster
#############################################################

output "ecs_cluster_name" {
  value = aws_ecs_cluster.restaurant_cluster.name
}

#############################################################
# ECR
#############################################################

output "frontend_ecr_repository" {
  value = aws_ecr_repository.frontend.repository_url
}

output "backend_ecr_repository" {
  value = aws_ecr_repository.backend.repository_url
}

#############################################################
# ALB
#############################################################

output "alb_dns_name" {
  value = aws_lb.restaurant_alb.dns_name
}

#############################################################
# ECS Services
#############################################################

output "frontend_service" {
  value = aws_ecs_service.frontend.name
}

output "backend_service" {
  value = aws_ecs_service.backend.name
}

#############################################################
# CloudWatch
#############################################################

output "frontend_log_group" {
  value = aws_cloudwatch_log_group.frontend.name
}

output "backend_log_group" {
  value = aws_cloudwatch_log_group.backend.name
}
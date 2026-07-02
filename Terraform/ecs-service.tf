#############################################################
# Frontend ECS Service
#############################################################

resource "aws_ecs_service" "frontend" {

  name            = "restaurant-frontend-service"
  cluster         = aws_ecs_cluster.restaurant_cluster.id
  task_definition = aws_ecs_task_definition.frontend.arn

  desired_count = 2

  launch_type = "FARGATE"

  platform_version = "LATEST"

  enable_execute_command = true

  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  network_configuration {

    assign_public_ip = false

    security_groups = [
      aws_security_group.frontend_sg.id
    ]

    subnets = [
      aws_subnet.private_subnet_1.id,
      aws_subnet.private_subnet_2.id
    ]
  }

  load_balancer {

    target_group_arn = aws_lb_target_group.frontend_tg.arn

    container_name = "restaurant-frontend"

    container_port = 80
  }

  depends_on = [
    aws_lb_listener.http
  ]

  tags = {
    Name = "restaurant-frontend-service"
  }
}

#############################################################
# Backend ECS Service
#############################################################

resource "aws_ecs_service" "backend" {

  name            = "restaurant-backend-service"

  cluster         = aws_ecs_cluster.restaurant_cluster.id

  task_definition = aws_ecs_task_definition.backend.arn

  desired_count = 2

  launch_type = "FARGATE"

  platform_version = "LATEST"

  enable_execute_command = true

  deployment_minimum_healthy_percent = 50

  deployment_maximum_percent = 200

  network_configuration {

    assign_public_ip = false

    security_groups = [
      aws_security_group.backend_sg.id
    ]

    subnets = [
      aws_subnet.private_subnet_1.id,
      aws_subnet.private_subnet_2.id
    ]
  }

  load_balancer {

    target_group_arn = aws_lb_target_group.backend_tg.arn

    container_name = "restaurant-backend"

    container_port = 5000
  }

  depends_on = [
    aws_lb_listener.http
  ]

  tags = {
    Name = "restaurant-backend-service"
  }
}
#############################################################
# Frontend CloudWatch Log Group
#############################################################

resource "aws_cloudwatch_log_group" "frontend" {

  name              = "/ecs/restaurant-frontend"

  retention_in_days = 30

  tags = {
    Name = "restaurant-frontend-log-group"
  }
}

#############################################################
# Backend CloudWatch Log Group
#############################################################

resource "aws_cloudwatch_log_group" "backend" {

  name              = "/ecs/restaurant-backend"

  retention_in_days = 30

  tags = {
    Name = "restaurant-backend-log-group"
  }
}
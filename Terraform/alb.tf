#############################################################
# Application Load Balancer
#############################################################

resource "aws_lb" "restaurant_alb" {

  name               = "restaurant-alb"

  internal           = false

  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = "restaurant-alb"
  }
}

#############################################################
# Frontend Target Group
#############################################################

resource "aws_lb_target_group" "frontend_tg" {

  name        = "restaurant-fe-tg"

  port        = 80

  protocol    = "HTTP"

  target_type = "ip"

  vpc_id = aws_vpc.main_vpc.id

  health_check {

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2
  }

  tags = {
    Name = "restaurant-frontend-tg"
  }
}

#############################################################
# Backend Target Group
#############################################################

resource "aws_lb_target_group" "backend_tg" {

  name        = "restaurant-be-tg"

  port        = 5000

  protocol    = "HTTP"

  target_type = "ip"

  vpc_id = aws_vpc.main_vpc.id

  health_check {

    path = "/api/health"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2
  }

  tags = {
    Name = "restaurant-backend-tg"
  }
}

#############################################################
# HTTP Listener
#############################################################

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.restaurant_alb.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.frontend_tg.arn

  }
}

#############################################################
# Backend Listener Rule
#############################################################

resource "aws_lb_listener_rule" "backend" {

  listener_arn = aws_lb_listener.http.arn

  priority = 100

  action {

    type = "forward"

    target_group_arn = aws_lb_target_group.backend_tg.arn

  }

  condition {

    path_pattern {

      values = [
        "/api/*"
      ]

    }
  }
}
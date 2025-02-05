# Security Group for Internet-facing ALB
resource "aws_security_group" "internet_alb_sg" {
  name_prefix = "frontend-sg"
  vpc_id      = var.vpc_id

  # Allow inbound HTTP (80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for Internal ALB
resource "aws_security_group" "internal_alb_sg" {
  name_prefix = "backend-sg"
  vpc_id      = var.vpc_id

  # Allow inbound HTTP (8000) only from within the VPC
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    #cidr_blocks = [var.vpc_cidr]
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Frontend Security Group
resource "aws_security_group" "frontend_sg" {
  name_prefix = "frontend-sg"
  vpc_id      = var.vpc_id

  # Allow inbound HTTP (80) from ALB security group
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.internet_alb_sg.id]
  }

  # Allow inbound HTTPS (443) from ALB security group
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.internet_alb_sg.id]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Internet-facing ALB
resource "aws_lb" "internet_alb" {
  name               = "chatbot-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.internet_alb_sg.id]
  subnets            = var.public_subnets

  enable_deletion_protection = false
}

# Internal-facing ALB
resource "aws_lb" "internal_alb" {
  name               = "chatbot-backend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.internal_alb_sg.id]
  #subnets            = var.private_subnets
  subnets            = var.public_subnets

  enable_deletion_protection = false
}

# Listener for Internet-facing ALB on port 80
resource "aws_lb_listener" "internet_alb_listener" {
  load_balancer_arn = aws_lb.internet_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.internet_alb_tg.arn
  }
}

# Listener for Internal-facing ALB on port 8000
resource "aws_lb_listener" "internal_alb_listener" {
  load_balancer_arn = aws_lb.internal_alb.arn
  port              = 8000
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.internal_alb_tg.arn
  }
}

# Target Group for Internet-facing ALB
resource "aws_lb_target_group" "internet_alb_tg" {
  name        = "chatbot-frontend-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"  # Use "ip" target type for IP address targets

  health_check {
    path                = "/forgot-password"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# Target Group for Internal ALB
resource "aws_lb_target_group" "internal_alb_tg" {
  name        = "chatbot-23-backend-tg"
  port        = 8000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"  # Use "ip" target type for IP address targets

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# DB Sunet Group
resource "aws_security_group" "db_security_group" {
  name        = "db-security-group"
  description = "Security group for RDS database"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    #cidr_blocks = ["10.0.0.0/20"]
    security_groups = [ aws_security_group.internal_alb_sg.id ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    #cidr_blocks = ["0.0.0.0/0"]
    security_groups = [ aws_security_group.internal_alb_sg.id ]
  }

  tags = {
    Name        = "db-security-group"
    Environment = "production"
  }
}
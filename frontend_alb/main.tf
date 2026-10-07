resource "aws_lb" "frontend_alb" {
  name               = "${local.common_name}-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.sg_id]
  subnets            = local.public_subnets

  enable_deletion_protection = false



  tags = merge(
    local.common_tags,
    {
      Name="${local.common_name}-frontend-alb"
    }
  )
}
resource "aws_lb_listener" "frontend_alb_listener" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hello,I'm from backend_alb the target group soon to be declared"
      status_code  = "200"
    }
  }
}
resource "aws_lb" "backend_alb" {
  name               = local.common_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.sg_id]
  subnets            = local.private_subnets

  enable_deletion_protection = true

  

  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name}-backend-alb"
    }
  )
}
resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "I from backend alb waiting for traffic from frontend alb"
      status_code  = "200"
    }
  }
}
resource "route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.dns_name}"
  type    = "A"
# these are alb things,not our domain names
  alias {
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
}
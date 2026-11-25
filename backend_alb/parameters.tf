resource "aws_ssm_parameter" "backend_lb_arn" {
  name  = "/${var.project_name}/${var.environment}/backend_lb_arn"
  type  = "String"
  value = aws_lb_listener.backend_alb.arn
}
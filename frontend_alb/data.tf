data "aws_ssm_parameter" "frontend_alb_sg_name" {
  name = "/${var.project_name}/${var.environment}/frontend_alb/sg_name"
}
data "aws_ssm_parameter" "public_subnets" {
  name = "/${var.project_name}/${var.environment}/public_subnets"
}
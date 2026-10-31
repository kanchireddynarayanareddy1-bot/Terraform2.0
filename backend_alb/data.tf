data "aws_ssm_parameter" "sg_name" {
  name="/${var.project_name}/${var.environment}/backend_alb/sg_name"
}
data "aws_ssm_parameter" "private_subnets" {
  name="/${var.project_name}/${var.environment}/private_subnets"
}
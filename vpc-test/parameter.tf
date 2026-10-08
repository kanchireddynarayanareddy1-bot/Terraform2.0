resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.main.vpc_id
}
resource "aws_ssm_parameter" "public_subnets" {
  name  = "/${var.project_name}/${var.environment}/public_subnets"
  type  = "StringList"
  value = join(",", module.main.public_subnets)
}
resource "aws_ssm_parameter" "private_subnets" {
  name  = "/${var.project_name}/${var.environment}/private_subnets"
  type  = "StringList"
  value = join(",", module.main.private_subnets)
}
resource "aws_ssm_parameter" "databases_subnets" {
  name  = "/${var.project_name}/${var.environment}/databases_subnets"
  type  = "StringList"
  value = join(",", module.main.databases_subnets)
}


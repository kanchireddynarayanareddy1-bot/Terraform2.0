resource "aws_ssm_parameter" "vpc_id" {
    name  = "/${var.project_name}/${var.environment}/vpc_id"
    type  = "String"
    value = module.vpc.vpc_id
}
resource "aws_ssm_parameter" "public_subnets" {
    name  = "/${var.project_name}/${var.environment}/public_subnets"
    type  = "String"
    value = join(",", module.vpc.public_subnets)
}
resource "aws_ssm_parameter" "private_subnets" {
    name  = "/${var.project_name}/${var.environment}/private_subnets"
    type  = "String"
    value = join(",", module.vpc.private_subnets)
}
resource "aws_ssm_parameter" "databases_subnets" {
    name  = "/${var.project_name}/${var.environment}/databases_subnets"
    type  = "String"
    value = join(",", module.vpc.databases_subnets)
}   


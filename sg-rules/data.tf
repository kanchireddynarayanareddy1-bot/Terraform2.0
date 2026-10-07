data "aws_ssm_parameter" "bastion_sg_name" {
  name = "/${var.project_name}/${var.environment}/bastion/sg_name"
}
data "aws_ssm_parameter" "mongodb_sg_name" {
  name = "/${var.project_name}/${var.environment}/mongodb/sg_name"
}
data "aws_ssm_parameter" "redis_sg_name" {
  name = "/${var.project_name}/${var.environment}/redis/sg_name"
}
data "aws_ssm_parameter" "mysql_sg_name" {
  name = "/${var.project_name}/${var.environment}/mysql/sg_name"
}
data "aws_ssm_parameter" "rabbitmq_sg_name" {
  name = "/${var.project_name}/${var.environment}/rabbitmq/sg_name"
}
data "aws_ssm_parameter" "frontend_sg_name" {
  name = "/${var.project_name}/${var.environment}/frontend/sg_name"
}
data "aws_ssm_parameter" "mongodb_sg_name" {
  name = "/${var.project_name}/${var.environment}/mongodb/sg_name"
}
data "aws_ssm_parameter" "redis_sg_name" {
  name = "/${var.project_name}/${var.environment}/redis/sg_name"
}
data "aws_ssm_parameter" "rabbitmq_sg_name" {
  name = "/${var.project_name}/${var.environment}/rabbitmq/sg_name"
}
data "aws_ssm_parameter" "mysql_sg_name" {
  name = "/${var.project_name}/${var.environment}/mysql/sg_name"
}
data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_ssm_parameter" "databases_subnets" {
  name  = "/${var.project_name}/${var.environment}/databases_subnets"
}
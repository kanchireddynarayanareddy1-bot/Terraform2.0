locals {
  common_name="${var.project_name}-${var.environment}"
  common_tags={
    Project=var.project_name
    Environment=var.environment
    Terraform=true
  }
  bastion_sg=data.aws_ssm_parameter.bastion_sg_name.value
  mongodb_sg=data.aws_ssm_parameter.mongodb_sg_name.value
  redis_sg=data.aws_ssm_parameter.redis_sg_name.value
  rabbitmq_sg=data.aws_ssm_parameter.rabbitmq_sg_name.value
  mysql_sg=data.aws_ssm_parameter.mysql_sg_name.value
}
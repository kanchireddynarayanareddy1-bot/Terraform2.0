locals {
  common_name="${var.project_name}-${var.environment}"
  common_tags={
    Project=var.project_name
    Environment=var.environment
    Terraform=true
  }
  mongodb=data.aws_ssm_parameter.mongodb_sg_name.value
  redis=data.aws_ssm_parameter.redis_sg_name.value
  rabbitmq=data.aws_ssm_parameter.rabbitmq_sg_name.value
  mysql=data.aws_ssm_parameter.mysql_sg_name.value
  ami_id=data.aws_ami.joindevops.id
  databases_subnets=split(",", data.aws_ssm_parameter.databases_subnets.value)[0]
}
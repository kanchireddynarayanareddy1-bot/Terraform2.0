locals {
  commom_name="${var.project_name}-${var.environment}"
  common_tags={
    Project=var.project_name
    Environment=var.environment
    Terraform=true
  }
  catalogue_sg=data.aws_ssm_parameter.catalogue_sg.value
  private_subnet=split(",", data.aws_ssm_parameter.private_subnets.value)[0]
  ami_id=data.aws_ami.joindevops.id
}
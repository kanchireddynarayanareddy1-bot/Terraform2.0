locals {
  common_name="${var.project_name}-${var.environment}"
  common_tags={
    Project=var.project_name
    Environment=var.environment
    Terraform=true
  }
  vpc_id=data.aws_ssm_parameter.vpc_id.value
  bastion_sg=data.aws_ssm_parameter.bastion_sg_name.value
  public_subnets=split(",", data.aws_ssm_parameter.public_subnets.value)[0]
  ami_id=data.aws_ami.joindevops.id
  
}
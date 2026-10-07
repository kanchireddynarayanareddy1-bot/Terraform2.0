locals {
  ami_id= data.aws_ami.chinna.id
  instance_type = "t3.micro"
  bastion_sg_id = data.aws_security_groups.bastion_sg.value
  common_name = "${var.project_name}-${var.environment}"
  tags={
    Project="roboshop"
    Environment="dev"
    terraform="true"
  }
}
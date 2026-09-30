locals {
  ami_id= data.aws_ami.chinna.id
  instance_type = "t3.micro"
  common_name = "${var.project_name}-${var.env}"
  tags={
    Project="roboshop"
    Environment="dev"
    terraform="true"
  }
}
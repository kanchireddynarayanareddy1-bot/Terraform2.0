resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg]
  subnet_id = local.public_subnets

  tags = merge(
    local.common_tags,
    {
      Name="${var.project_name}-${var.environment}-bastion"
    }
  )

}
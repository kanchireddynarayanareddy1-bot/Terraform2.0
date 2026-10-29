resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg]
  subnet_id = local.public_subnets
  user_data = file("terraform.sh")
  iam_instance_profile = aws_iam_instance_profile.bastion.name

  tags = merge(
    local.common_tags,
    {
      Name="${var.project_name}-${var.environment}-bastion"
    }
  )
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
    delete_on_termination = true
  }
}
 resource "aws_iam_instance_profile" "bastion" {
  name = "bastion"
  role = "BastionTerraformAdmin"
} 
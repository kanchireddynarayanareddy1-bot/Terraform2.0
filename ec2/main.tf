resource "aws_instance" "terraform_instance" {
  count= length(var.instances)
  ami           = local.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]

  tags = merge(
    local.tags,
    {
      Name = "${local.common_name}-${var.instances[count.index]}"
    }
  )
}
resource "aws_security_group" "terraform_sg" {
  name = "terraform-sg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
        Name = "terraform-sg"
        terraform = "true"
    }  
}
resource "aws_route53_record" "terraform_record" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.terraform_instance[count.index].private_ip]
  allow_overwrite = true
}


resource "aws_instance" "terraform_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]

  tags = {
    Name = "redis"
    terraform = "true"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
    on_failure = continue
  }
  provisioner "local-exec" {
    command = "echo instance is running"
    on_failure = continue
  }
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
# resource "aws_route53_record" "terraform_record" {
#   for_each = aws_instance.terraform_instance
#   zone_id = var.zone_id
#   name    = "${each.key}.${var.domain_name}"
#   type    = "A"
#   ttl     = "1"
#   records = [each.value.private_ip]
#   allow_overwrite = true
# }


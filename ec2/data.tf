data "aws_ami" "chinna" {
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "ami_id" {
  value = data.aws_ami.chinna.id
}

# data aws_instance "mongodb" {
#     instance_id = "i-04ee0cc9f539dfbea"
# }
# output "mongodb_private_ip" {
#     value = data.aws_instance.mongodb.private_ip
# }
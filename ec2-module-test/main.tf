module "instance" {
    source = "../ec2-module"
    ami_id = var.ami_id
    instance_type = var.instance_type
    sg_id = var.sg_id
    tags = var.tags
}
output "instance_id" {
    value = module.instance.instance_id
}
output "public_ip" {
    value = module.instance.public_ip
}
output "private_ip" {
    value = module.instance.private_ip
}
variable "project_name" {
  default = "roboshop"
}
variable "environment" {
  default = "dev"
}
variable "sg_name" {
  default=[
     # databases
    "mongodb", "redis", "mysql", "rabbitmq",
    # backend
    "catalogue", "user", "cart", "shipping", "payment",
    # frontend
    "frontend",
    # bastion
    "bastion",
    # frontend load balancer
    "frontend_alb",
    # backend alb
    "backend_alb"
  ]
}
variable "tags" {
  type = map
  default = {}
}
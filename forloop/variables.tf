variable "ami_id" {
    type = string
  default = "ami-0220d79f3f480ecf5"
}
variable "instance_type" {
    type = string
    default = "t3.micro"
#   validation {
#     condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
#     error_message = "Instance type must be one of t3.micro, t3.small, or t3.medium."
#   }
}
variable "instances"{
    type=map(string)
    default={
        mongodb="mongodb"
        redis="redis"
    }
}
variable "zone_id" {
    type = string
    default = "Z00360111YCBT2EKROU2Y"
}
variable "domain_name" {
    type = string
    default = "chandrahasa.online"
}
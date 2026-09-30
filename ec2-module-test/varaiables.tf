variable "ami_id" {
  type = string  
  default = "ami-0220d79f3f480ecf5"
}
variable "instance_type" {
  default = "t3.small"
}
variable "sg_id" {
  default = ["sg-027b2ecac92bbbfcf"]
}
variable "tags" {
  default = {
    Name = "roboshop"
    Environment = "dev"
  }
}
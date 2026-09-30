variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}
variable "project_name" {
  type        = string
  description = "The name of the project for tagging purposes"
}
variable "environment" {
  type        = string
  description = "The environment for tagging purposes (e.g., dev, staging, prod)"
}
variable "tags" {
  type        = map
  default     = {}
  description = "A map of tags to assign to the resources"
}
variable "igw_tags" {
  type        = map
  default     = {}
  description = "A map of tags to assign to the Internet Gateway"
}
variable "public_subnet_cidr" {
  type        = list
}
variable "private_subnet_cidr" {
  type        = list
}
variable "databases_subnet_cidr" {
  type        = list
}
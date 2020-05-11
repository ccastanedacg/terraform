#------compute/variables.tf
variable "app" {
  description = "The name of the app"
  default     = "app"
}
variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-east-1"
}
variable "environment" {
  description = "The environment, such as development/stage/production"
  default     = "poc"
}
variable "vpc_id" {
  description = "The ID of the VPC"
}
variable "subnet_ids" {
  description = "List of subnet IDs for ASG"
  type        = "list"
}
variable "key_name" {
  default = "tfkey"
}
variable "public_key_path" {
  default = "my_id_rsa.pub"
}
#variable "subnet_ips" {
#  type = "list"
#}
variable "instance_count" {}
variable "instance_type" {}
#variable "security_group" {}
#variable "subnets" {
#  type = "list"
#}
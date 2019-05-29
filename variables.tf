#-------root/variables.tf
#variable "" {}
variable "aws_region" {}
variable "app" {}
variable "environment" {}

#------networking variables
variable "vpc_cidr" {}
variable "public_subnets" { type = "list"}
variable "private_subnets" {type = "list"}

#------asg variables
variable "key_name" {}
variable "public_key_path" {}

#------lb variables
variable "app_port" {}

#------compute variables
variable "instance_type" {}
variable "instance_count" {}
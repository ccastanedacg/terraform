#-------db/variables.tf
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
  description = "List of subnet IDs for RDS"
  type        = "list"
}
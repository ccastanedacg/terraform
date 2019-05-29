#-------networking/variables.tf
variable "app" {
  description = "The name of the app"
  default     = "network"
}

variable "environment" {
  description = "The environment, such as development/stage/production"
  default     = "poc"
}

variable "vpc_cidr" {
  description = "The CIDR range to use in the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "The CIDR ranges to use in the public subnets"
  default     = ["10.0.102.0/24", "10.0.103.0/24"]
  type        = "list"
}

variable "private_subnets" {
  description = "The CIDR ranges to use in the private subnets"
  default     = ["10.0.1.0/24","10.0.2.0/24"]
  type        = "list"
}

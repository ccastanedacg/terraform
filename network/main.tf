#-------networking/main.tf
# Creates VPC resources on AWS
# https://github.com/terraform-aws-modules/terraform-aws-vpc
# TODO: Recreate vpc resources
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "1.19.0"

  name = "${var.app}-${var.environment}"
  cidr = "${var.vpc_cidr}"

  # Creates subnets in only two availability zones
  azs = ["us-east-1a", "us-east-1b"]

  enable_dhcp_options = true

  private_subnets     = "${var.private_subnets}"
  private_subnet_tags = {
    Name = "${var.app}-${var.environment}-private"
    type = "private"
  }

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnets = "${var.public_subnets}"
  public_subnet_tags = {
    Name = "${var.app}-${var.environment}-public"
    type = "public"
  }

  tags = {
    Name        = "${var.app}-${var.environment}"
    environment = "${var.environment}"
    service     = "network"
    terraform   = "true"
  }
}

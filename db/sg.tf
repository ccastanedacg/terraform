#-------compute/sg.tf
# Creates EC2-VPC security groups on AWS
# https://github.com/terraform-aws-modules/terraform-aws-security-group
module "sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "1.19.0"
  name        = "${var.app}-${var.environment}-rds"
  description = "Mysql access from anywhere to rds"
  vpc_id      = "${var.vpc_id}"

  # TODO: Add ingress/egress rules
  ingress_with_cidr_blocks = [
    {
      from_port   = 9043
      to_port     = 9043
      protocol    = "tcp"
      description = "Rds-service port"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules  = ["all-all"]

  tags = {
    Name        = "${var.app}-${var.environment}"
    environment = "${var.environment}"
    service     = "${var.app}"
    terraform   = "true"
  }
}

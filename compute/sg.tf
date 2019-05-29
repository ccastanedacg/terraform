#-------compute/sg.tf
# Creates EC2-VPC security groups on AWS
# https://github.com/terraform-aws-modules/terraform-aws-security-group
module "sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "1.19.0"
  name        = "${var.app}-${var.environment}-app"
  description = "HTTP access from anywhere to app"
  vpc_id      = "${var.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]

  # TODO: Add ingress/egress rules
  ingress_rules =["ssh-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 9043
      to_port     = 9043
      protocol    = "tcp"
      description = "App-service port"
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

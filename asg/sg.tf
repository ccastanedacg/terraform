#-------asg/sg.tf
# Creates EC2-VPC security groups on AWS
# https://github.com/terraform-aws-modules/terraform-aws-security-group
module "sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "1.19.0"
  name        = "${var.app}-${var.environment}"
  description = "HTTP access from anywhere"
  vpc_id      = "${var.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]

  # TODO: Add ingress/egress rules
  ingress_rules =["http-8080-tcp","ssh-tcp"]
  egress_rules  = ["all-all"]

  tags = {
    Name        = "${var.app}-${var.environment}"
    environment = "${var.environment}"
    service     = "${var.app}"
    terraform   = "true"
  }
}

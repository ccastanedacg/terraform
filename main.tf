#-------root/main.tf
provider "aws" {
  region = "${var.aws_region}"
}

#Deploy Networking Resources
module "networking"{
  source = "./network"
  app = "${var.app}"
  environment = "${var.environment}"
  vpc_cidr = "${var.vpc_cidr}"
  public_subnets = "${var.public_subnets}"
  private_subnets = "${var.private_subnets}"
}

#Deploy ASG Resources
module "asg" {
  source = "./asg"
  app = "${var.app}-web"
  environment = "${var.environment}"
  vpc_id = "${module.networking.vpc_id}"
  subnet_ids = "${module.networking.public_subnet_ids}"
  key_name = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
}

#Deploy LB Resources
module "lb" {
  source = "./lb"
  app = "${var.app}-web"
  environment = "${var.environment}"
  vpc_id = "${module.networking.vpc_id}"
  subnet_ids = "${module.networking.public_subnet_ids}"
  app_port = "${var.app_port}"
  asg_id = "${module.asg.asg_name}"
}

#Deploy Compute Resources
module "compute" {
  source = "./compute"
  app = "${var.app}-app"
  environment = "${var.environment}"
  vpc_id = "${module.networking.vpc_id}"
  subnet_ids = "${module.networking.private_subnet_ids}"
  instance_count = "${var.instance_count}"
  key_name = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_type = "${var.instance_type}"
}

#Deploy DB Resources
module "db" {
  source = "./db"
  app = "${var.app}"
  environment = "${var.environment}"
  vpc_id = "${module.networking.vpc_id}"
  subnet_ids = "${module.networking.private_subnet_ids}"
}

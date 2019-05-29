#----root/outputs.tf-----

#---Networking Outputs -----
output "vpc_id" {
  value = "${module.networking.vpc_id}"
}
output "private_subnet_ids" {
  value = "${module.networking.private_subnet_ids}"
}

output "public_subnet_ids" {
  value = "${module.networking.public_subnet_ids}"
}

#---AGG Outputs -----
output "asg_name" {
  value = "${module.asg.asg_name}"
}

#---LB Outputs -----
output "lb_dns_name" {
  value = "${module.lb.lb_dns_name}"
}
output "lb_zone_id" {
  value = "${module.lb.lb_zone_id}"
}
output "load_balancer_arn" {
  value = "${module.lb.load_balancer_arn}"
}

#---Compute Outputs -----
output "server_id" {
  value = "${module.compute.server_id}"
}

#---DB Outputs -----
output "this_db_instance_name" {
  description = "The database name"
  value       = "${module.db.this_db_instance_name}"
}
output "this_db_instance_id" {
  description = "The RDS instance ID"
  value       = "${module.db.this_db_instance_id}"
}

output "this_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = "${module.db.this_db_instance_resource_id}"
}
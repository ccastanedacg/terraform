#-------db/outputs.tf
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
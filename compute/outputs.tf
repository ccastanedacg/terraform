#------compute/outputs.tf

output "server_id" {
  value = "${join(", ", aws_instance.tf_server.*.id)}"
}
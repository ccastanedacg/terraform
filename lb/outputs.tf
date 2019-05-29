#-------lb/outputs.tf
output "lb_dns_name" {
  value = "${aws_elb.app.dns_name}"
}

output "lb_zone_id" {
  value = "${aws_elb.app.zone_id}"
}

output "load_balancer_arn" {
  value = "${aws_elb.app.arn}"
}
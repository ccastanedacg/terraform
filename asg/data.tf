#-------asg/data.tf
# Most recent Amazon Linux 2 AMI
data "aws_ami" "amz_linux_2" {
  most_recent = true
  owners = ["amazon"]
  
  filter {
      name = "name"
      values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

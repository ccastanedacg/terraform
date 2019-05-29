# root
aws_region = "us-east-1"
app = "xport"
environment = "test"

# networking
vpc_cidr = "10.0.0.0/16"
public_subnets = ["10.0.102.0/24", "10.0.103.0/24"]
private_subnets = ["10.0.1.0/24","10.0.2.0/24"]

# asg
key_name = "tf_key"
public_key_path = "/home/epyon/.ssh/id_rsa.pub"

# lb
app_port = "8080"

# compute
instance_type = "t2.micro"
instance_count = 1
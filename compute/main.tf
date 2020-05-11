#------compute/main.tf

data "aws_ami" "server_ami" {
  most_recent = true
  owners = [
    "amazon"]

  filter {
    name = "name"
    values = [
      "amzn-ami-hvm*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "tf_auth" {
  key_name = "${var.key_name}-app"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "tf_server" {
  count = var.instance_count
  instance_type = var.instance_type
  ami = data.aws_ami.server_ami.id
  tags = {
    Name = "${var.app}-${var.environment}-${count.index + 1}"
    environment = var.environment
    service = var.app
    terraform = "true"
  }
  key_name = aws_key_pair.tf_auth.id
  vpc_security_group_ids = [
    module.sg.this_security_group_id]
  subnet_id = element(var.subnet_ids, count.index)
}

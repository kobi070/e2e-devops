# Creation of ec2 ubunto instance
# Varibales: ubuntu_ami, instance_type, name

provider "aws" {
  region = var.aws_region 
}

resource "aws_instance" "ec2-ubuntu" {
  ami                         = var.ubuntu_ami # Ubuntu AMI
  instance_type               = var.instance_type # t3.medium
  subnet_id                   = data.aws_subnets.selected.ids[0] # Take from data.tf
  key_name                    = aws_key_pair.builder_key.key_name # Take from key.tf
  associate_public_ip_address = true
  security_groups             = [aws_security_group.sg.id]

  tags = {
    "Name" = "${var.name}-builder"
  }
}

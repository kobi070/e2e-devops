# Creation of ec2 ubunto instance
# Varibales: ubuntu_ami, instance_type, name
# Resource: aws_instances
# Depends on: aws_vpc.custom_vpc
# Security Group: aws_security_group.sg.id
# Subnet: aws_subnet.public_custom_subnet.id
provider "aws" {
  region = var.aws_region 
}

resource "aws_instance" "ec2-ubuntu" {
  ami                         = var.ubuntu_ami # Ubuntu AMI
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_custom_subnet.id
  key_name                    = var.ssh_key_name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.sg.id]

  tags = {
    "Name" = "${var.name}-builder"
  }
  depends_on = [aws_vpc.custom_vpc]
}

# Terraform security_group
# Createed a aws security group using aws_security_group resource
# Open port 22 for ssh ingress=inbound rules and egress=outbound rules
# Open port 5001 for our python webapp and 8080 for jenkins usage
resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
  description = "Allow inbound traffic for SSH and HTTP"
  name        = "${var.name}-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.name}-builder-sg"
  }
}

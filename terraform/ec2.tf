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

  provisioner "remote-exec" {
    inline = [
    "sudo apt update -y",
    "sudo apt install -y docker.io",
    "sudo systemctl start docker",
    "sudo usermod -aG docker ubuntu",
    "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
    "sudo chmod +x /usr/local/bin/docker-compose"
  ]


    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.my_key.private_key_pem
      host        = self.public_ip
    }
  }

  tags = {
    "Name" = "${var.name}-builder"
  }
}

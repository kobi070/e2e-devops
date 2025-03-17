# Generate an SSH key pair
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/builder_key_${var.name}.pem"
  file_permission = "0600"
}

# Create an AWS key pair using the public key
resource "aws_key_pair" "builder_key" {
  key_name   = "builder-key-${var.name}"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# Output the necessary details
output "ssh_private_key_path" {
  value       = local_file.private_key.filename
  description = "Path to the generated private SSH key"
  sensitive   = true
}

output "ssh_key_name" {
  value       = aws_key_pair.builder_key.key_name
  description = "Name of the AWS SSH key pair"
}
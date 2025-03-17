output "ec2_ip" {
  description = "The Kobi-builder public ip"
  value       = aws_instance.ec2-ubuntu.public_ip
}

output "ssh_key_location" {
  description = "The SSH key location"
  value       = aws_key_pair.builder_key.id
}

output "sg_id" {
  description = "The security group ID"
  value       = aws_security_group.sg.id
}

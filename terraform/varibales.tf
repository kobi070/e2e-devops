variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "name" {
  type        = string
  description = "Name of the VPC/EC2/SG/Etc"
  default     = "Kobi"
}

variable "vpc_id" {
  type = string
  description = "The VPC ID given to us by Instcurtor"
  default = "vpc-044604d0bfb707142"
}

variable "ubuntu_ami" {
  type        = string
  description = "Ubuntu AMI"
  default     = "ami-0c55b159cbfafe1f0" # TODO: Get the AMI from Data resource 
}

variable "instance_type" {
  type        = string
  description = "value of the instance type"
  default     = "t3.medium"
}


variable "ssh_key_name" {
  type        = string
  description = "SSH key name"
  default     = "kobi"
}

variable "file_name" {
  type        = string
  description = "File name for the key"
  default     = "kobi.pem"
}



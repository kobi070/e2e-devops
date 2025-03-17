
# Get the VPC details
data "aws_vpc" "selected" {
  id = "vpc-044604d0bfb707142"
}

# Get all subnets within the VPC
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Get all security groups associated with the VPC
data "aws_security_groups" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Get all route tables in the VPC
data "aws_route_tables" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Get internet gateway if exists
data "aws_internet_gateway" "selected" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Get NAT gateways
data "aws_nat_gateways" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Output values
output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "subnets" {
  value = data.aws_subnets.selected.ids
}

output "security_groups" {
  value = data.aws_security_groups.selected.ids
}

output "route_tables" {
  value = data.aws_route_tables.selected.ids
}

output "internet_gateway" {
  value = data.aws_internet_gateway.selected.id
}

output "nat_gateways" {
  value = data.aws_nat_gateways.selected.ids
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}
# Public Subnet
variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

# Private Subnet
variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

# Availability Zone
variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}
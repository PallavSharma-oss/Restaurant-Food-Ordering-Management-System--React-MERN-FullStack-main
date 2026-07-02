variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

##############################
# Public Subnets
##############################

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

##############################
# Private Subnets
##############################

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}

##############################
# Availability Zones
##############################

variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  type = string
}
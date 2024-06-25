variable "aws_region" {
  type        = string
  description = "The AWS region to deploy in"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for the public subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for the public subnets"
}

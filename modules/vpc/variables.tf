variable "aws_region" {
  description = "The AWS region to deploy in"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones"
  type        = list(string)
}

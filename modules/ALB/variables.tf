variable "vpc_id" {
  description = "VPC ID where ALBs will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for internet-facing ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs for internal-facing ALB"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_ip_targets" {
  description = "List of private IP addresses in private subnets for target groups"
  type        = list(string)
}

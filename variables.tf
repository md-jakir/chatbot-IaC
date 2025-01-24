variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, production)"
  type        = string
}

# variable "vpc_id" {
#   description = "VPC ID where ALBs will be deployed"
#   type        = string
# }

variable "private_ip_targets" {
  description = "List of private IP addresses in private subnets for target groups"
  type        = list(string)
}

# variables.tf
variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "chatbot-cluster"
}

# Root variables.tf
variable "repository_names" {
  description = "Names of the ECR repositories to create"
  type        = list(string)
  default     = ["chatbot-frontend", "chatbot-backend"]
}

# variable "execution_role_arn" {
#   description = "IAM role for ECS task execution"
#   type        = string
# }

# variable "task_role_arn" {
#   description = "IAM role for ECS tasks"
#   type        = string
# }

variable "frontend" {
  description = "Frontend container configuration"
  type = object({
    image   = string
    cpu     = number
    memory  = number
    port    = number
  })
  default = {
    image   = "905418236735.dkr.ecr.ap-southeast-1.amazonaws.com/dev-chatbot-frontend:latest"
    cpu     = 256
    memory  = 512
    port    = 80
  }
}

variable "backend" {
  description = "Backend container configuration"
  type = object({
    image   = string
    cpu     = number
    memory  = number
    port    = number
  })
  default = {
    image   = "905418236735.dkr.ecr.ap-southeast-1.amazonaws.com/dev-chatbot-backend:latest"
    cpu     = 256
    memory  = 512
    port    = 8000
    hostport = 8000
  }
}



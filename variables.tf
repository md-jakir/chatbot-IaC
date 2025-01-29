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


variable "nextauth_secret" {
  description = "NextAuth secret value"
  type        = string
  sensitive   = true
}

variable "db_url" {
  description = "Database URL"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "jwt secret"
  type        = string
  sensitive   = true
}

variable "jwt_secret_for_verify" {
  description = "JWT secret for verify"
  type        = string
  #default     = ""
  sensitive = true
}

variable "openai_api_key" {
  description = "OpenAI API key"
  type        = string
  #default     = ""
  sensitive = true
}

variable "sender_password" {
  description = "Sender Password"
  type        = string
  #default     = ""
  sensitive = true
}

variable "access_key" {
  description = "Access key"
  type        = string
  #default     = ""
  sensitive = true
}

variable "secret_key" {
  description = "Secret key"
  type        = string
  #default     = ""
  sensitive = true
}

variable "session_token" {
  description = "Session token"
  type        = string
  #default     = ""
  sensitive = true
}




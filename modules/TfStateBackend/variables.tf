variable "environment" {
  description = "Environment name (e.g., dev, staging, production)"
  type        = string
  default = "PROD"
}

variable "project_name" {
  description = "The Project Name"
  type        = string
  default = "chatbot23"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

# variable "backend_bucket_name" {
#   description = "The S3 Backend Bucket Name"
#   type        = string
# }
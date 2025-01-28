# variable "ssm_parameters" {
#   type = map(object({
#     description = string
#     type        = string
#     value       = string
#   }))
#   default = {
#     # nextauth_secret_name = {
#     #   description = "Name of the nextauth secret"
#     #   type        = "String"
#     #   value       = "secret"
#     # },
#     nextauth_secret = {
#       description = "Secret Value for nextauth"
#       type        = "String"
#       #value       = getenv("NEXTAUTH_SECRET", "")
#       #default = ""
#     },
#     db_url = {
#       description = "Database URL for the application"
#       type        = "SecureString"
#       #value       = getenv("DB_URL", "")
#       #default = ""
#     },
#     jwt_secret = {
#       description = "JWT Secret for signing"
#       type        = "String"
#       #value       = getenv("JWT_SECRET", "")
#       #default = ""
#     },
#     jwt-secret-for-verify = {
#       description = "JWT Secret for verification"
#       type        = "String"
#       #value       = getenv("JWT_SECRET_FOR_VERIFY", "")
#       #default = ""
#     },
#     openai-api-key = {
#       description = "OpenAI API Key"
#       type        = "String"
#       #value       = getenv("OPENAI_API_KEY", "")
#       #default = ""
#     },
#     sender-password = {
#       description = "Sender Password"
#       type        = "String"
#       #value       = getenv("SENDER_PASSWORD", "")
#       #default = ""
#     },
#     access-key = {
#       description = "access key"
#       type        = "String"
#       #value       = getenv("key", "")
#       #default = ""
#     },
#     secret-key = {
#       description = "secret key"
#       type        = "String"
#       #value       = getenv("secret", "")
#       #default = ""
#     },
#     session-token = {
#       description = "Session Token"
#       type        = "String"
#       #value       = getenv("session_token", "")
#       #default = ""
#     }
#   }
# }

variable "NEXTAUTH_SECRET" {
  description = "NextAuth secret value"
  type        = string
  #default     = ""
}

variable "DB_URL" {
  description = "Database URL"
  type        = string
  #default     = ""
}

variable "JWT_SECRET" {
  description = "JWT secret"
  type        = string
  #default     = ""
}

variable "JWT_SECRET_FOR_VERIFY" {
  description = "JWT secret for verify"
  type        = string
  default     = ""
}

variable "OPENAI_API_KEY" {
  description = "OpenAI API key"
  type        = string
  default     = ""
}

variable "SENDER_PASSWORD" {
  description = "Sender Password"
  type        = string
  default     = ""
}

variable "ACCESS_KEY" {
  description = "Access key"
  type        = string
  default     = ""
}

variable "SECRET_KEY" {
  description = "Secret key"
  type        = string
  default     = ""
}

variable "SESSION_TOKEN" {
  description = "Session token"
  type        = string
  default     = ""
}
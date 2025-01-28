variable "ssm_parameters" {
  type = map(object({
    description = string
    type        = string
    value       = string
  }))
}
# locals {
#   ssm_parameters = {
#     # nextauth_secret_name = {
#     #   description = "Name of the nextauth secret"
#     #   type        = "String"
#     #   value       = "secret"
#     # },
#     nextauth_secret = {
#       description = "Secret Value for nextauth"
#       type        = "String"
#       #value       = getenv("NEXTAUTH_SECRET", "")
#       default = ""
#     },
#     db_url = {
#       description = "Database URL for the application"
#       type        = "SecureString"
#       #value       = getenv("DB_URL", "")
#       default = ""
#     },
#     jwt_secret = {
#       description = "JWT Secret for signing"
#       type        = "String"
#       #value       = getenv("JWT_SECRET", "")
#       default = ""
#     },
#     jwt-secret-for-verify = {
#       description = "JWT Secret for verification"
#       type        = "String"
#       #value       = getenv("JWT_SECRET_FOR_VERIFY", "")
#       default = ""
#     },
#     openai-api-key = {
#       description = "OpenAI API Key"
#       type        = "String"
#       #value       = getenv("OPENAI_API_KEY", "")
#       default = ""
#     },
#     sender-password = {
#       description = "Sender Password"
#       type        = "String"
#       #value       = getenv("SENDER_PASSWORD", "")
#       default = ""
#     },
#     access-key = {
#       description = "access key"
#       type        = "String"
#       #value       = getenv("key", "")
#       default = ""
#     },
#     secret-key = {
#       description = "secret key"
#       type        = "String"
#       #value       = getenv("secret", "")
#       default = ""
#     },
#     session-token = {
#       description = "Session Token"
#       type        = "String"
#       #value       = getenv("session_token", "")
#       default = ""
#     }
#   }
#}

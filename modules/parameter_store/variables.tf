variable "ssm_parameters" {
  type = map(object({
    description = string
    type        = string
    value       = string
  }))
}
locals {
  ssm_parameters = {
    # nextauth_secret_name = {
    #   description = "Name of the nextauth secret"
    #   type        = "String"
    #   value       = "secret"
    # },
    nextauth_secret = {
      description = "Secret Value for nextauth"
      type        = "String"
      value       = getenv("NEXTAUTH_SECRET", "")
    },
    db_url = {
      description = "Database URL for the application"
      type        = "SecureString"
      value       = getenv("DB_URL", "")
    },
    jwt_secret = {
      description = "JWT Secret for signing"
      type        = "String"
      value       = getenv("JWT_SECRET", "")
    },
    jwt-secret-for-verify = {
      description = "JWT Secret for verification"
      type        = "String"
      value       = getenv("JWT_SECRET_FOR_VERIFY", "")
    },
    openai-api-key = {
      description = "OpenAI API Key"
      type        = "String"
      value       = getenv("OPENAI_API_KEY", "")
    },
    sender-password = {
      description = "Sender Password"
      type        = "String"
      value       = getenv("SENDER_PASSWORD", "")
    },
    access-key = {
      description = "access key"
      type        = "String"
      value       = getenv("key", "")
    },
    secret-key = {
      description = "secret key"
      type        = "String"
      value       = getenv("secret", "")
    },
    session-token = {
      description = "Session Token"
      type        = "String"
      value       = getenv("session_token", "")
    }
  }
}

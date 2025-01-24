variable "ssm_parameters" {
  type = map(object({
    description = string
    type        = string
    value       = string
  }))
  default = {
    # nextauth_secret_name = {
    #   description = "Name of the nextauth secret"
    #   type        = "String"
    #   value       = "secret"
    # },
    nextauth_secret = {
      description = "Secret Value for nextauth"
      type        = "String"
      value       = ""
    },
    db_url = {
      description = "Database URL for the application"
      type        = "SecureString"
      value       = ""
    },
    jwt_secret = {
      description = "JWT Secret for signing"
      type        = "String"
      value       = ""
    },
    jwt-secret-for-verify = {
      description = "JWT Secret for verification"
      type        = "String"
      value       = ""
    },
    openai-api-key = {
      description = "OpenAI API Key"
      type        = "String"
      value       = ""
    },
    sender-password = {
      description = "Sender Password"
      type        = "String"
      value       = ""
    },
    access-key = {
      description = "access key"
      type        = "String"
      value       = ""
    },
    secret-key = {
      description = "secret key"
      type        = "String"
      value       = ""
    },
    session-token = {
      description = "Session Token"
      type        = "String"
      value       = ""
    }
  }
}

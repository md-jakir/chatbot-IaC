# resource "aws_ssm_parameter" "parameters" {
#   for_each    = var.ssm_parameters
#   name        = each.key
#   description = each.value.description
#   type        = each.value.type
#   value       = each.value.value

#   tags = {
#     Environment = "dev"
#   }
# }

resource "aws_ssm_parameter" "nextauth_secret" {
  name        = "NextauthSecret"
  type        = "SecureString"
  value       = var.NEXTAUTH_SECRET
  description = "NextAuth Secret"
}

resource "aws_ssm_parameter" "db_url" {
  name        = "DBUrl"
  type        = "SecureString"
  value       = var.DB_URL
  description = "Database URL"
}

resource "aws_ssm_parameter" "jwt_secret" {
  name        = "jwt_secret"
  type        = "SecureString"
  value       = var.JWT_SECRET
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "jwt_secret_for_verify" {
  name        = "jwt_secret_for_verify"
  type        = "SecureString"
  value       = var.JWT_SECRET_FOR_VERIFY
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "openai_api_key" {
  name        = "openai_api_key"
  type        = "SecureString"
  value       = var.OPENAI_API_KEY
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "sender_password" {
  name        = "sender_password"
  type        = "SecureString"
  value       = var.SENDER_PASSWORD
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "access_key" {
  name        = "access_key"
  type        = "SecureString"
  value       = var.ACCESS_KEY
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "secret_key" {
  name        = "secret_key"
  type        = "SecureString"
  value       = var.SECRET_KEY
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "session_token" {
  name        = "session_token"
  type        = "SecureString"
  value       = var.SESSION_TOKEN
  description = "JWT Secret"
}
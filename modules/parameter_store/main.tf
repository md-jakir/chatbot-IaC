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
  name        = "nextauth_secret"
  type        = "SecureString"
  value       = var.NEXTAUTH_SECRET
  description = "NextAuth Secret"
}

resource "aws_ssm_parameter" "db_url" {
  name        = "db_url"
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

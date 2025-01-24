resource "aws_s3_bucket" "terraform_state" {
  bucket        = "${var.project_name}-tf-state-${var.region}"

  tags = {
    Name        = "${var.project_name}-tf-state"
    Environment = var.environment
  }
}

# terraform {
#   backend "s3" {
#     #bucket         = "${var.project_name}-tf-state-${var.region}"
#     bucket         = aws_s3_bucket.terraform_state.bucket
#     key            = "terraform/state.tfstate" # Path within the bucket
#     region         = var.region
#     encrypt        = true
#     #dynamodb_table = "${var.project_name}-tf-locks"
#   }
# }
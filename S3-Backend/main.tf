# Terraform code to deploy S3 bucket and DynamoDB table to use as a backend
terraform {
  required_version = "~> 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.72.0"
    }
  }
}

# We are using profile to authenticate with AWS. If you are using environment variables, you can remove the profile attribute.
provider "aws" {
  region  = "eu-north-1"
  profile = "SSOProfileForBackendAccount"
}

resource "aws_s3_bucket" "backend" {
  bucket = "your-bucket-name"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform-lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}

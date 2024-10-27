# Terraform code to use S3 as a backend
terraform {
  required_version = "~> 1.9.0"

  # We are using profile to authenticate with AWS. If you are using environment variables, you can remove the profile attribute.
  backend "s3" {
    region         = "eu-north-1"
    bucket         = "your-bucket-name"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-lock"
    profile        = "SSOProfileForBackendAccount"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.72.0"
    }
  }
}

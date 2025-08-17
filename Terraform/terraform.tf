# Terraform settings & remote backend
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # --- Remote state backend (recommended for teams) ---
  # Replace the placeholders below before 'terraform init'
  backend "s3" {
    bucket         = "CHANGE_ME-terraform-state"
    key            = "envs/${terraform.workspace}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "CHANGE_ME-terraform-lock"
    encrypt        = true
  }
}

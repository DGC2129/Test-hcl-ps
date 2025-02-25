# Terraform Block
terraform {
  required_version = ">= 0.12" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  backend "s3" {
    bucket = "gopi-terraform-state"
    key    = "gopi-terraform-state.tfstate"
    region = "us-east-1"
  }
    # null {
    #   source  = "hashicorp/null"
    #   version = ">= 3.0"
    # }
}

# Provider Block
provider "aws" {
  region = var.aws_region
}
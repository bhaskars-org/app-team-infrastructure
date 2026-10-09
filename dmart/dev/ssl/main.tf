terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "dmart-bucket-123-abc"
    key          = "/dev/ssl/terraform.tfstate"
    region       = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Application = var.application
      Environment = var.environment
      ManagedBy   = "Terraform"
      Team        = "App-Team"
    }
  }
}

# SSL / ACM module owned by Cloud Team
module "ssl" {
  source = "https://github.com/bhaskar319-byte/cloud-team-terraform/tree/main"

  application  = var.application
  environment = var.environment
  domain_name  = var.domain_name

  validation_method = "DNS"

  tags = {
    Application = var.application
    Environment = var.environment
    Service     = "SSL"
  }
}
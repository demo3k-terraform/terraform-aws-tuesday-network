terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96"
    }
  }
  required_version = "~> 1.11"
}
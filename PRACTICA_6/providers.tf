terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.57.0, !=5.59.0, <5.61.0"
    }
  }
  required_version = ">=1.9.4"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}

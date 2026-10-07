terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
  backend "s3" {
    bucket = "narayanareddy-bucket"
    key    = "frontend-alb-demo-terraform2.0"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true

  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
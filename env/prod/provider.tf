terraform {
  required_version = ">= 0.12.0"
  backend "s3" {
    bucket = "bucket_name"
    key    = "prod_sagemaker/services"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "prod-cloud"
  region = "us-east-1"
}

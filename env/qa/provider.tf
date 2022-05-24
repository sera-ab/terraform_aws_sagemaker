terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    bucket = "tf-qa-bucket"
    key    = "qa_sagemaker/services"
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
  profile = "dev-cloud"
  region  = "us-east-1"
}

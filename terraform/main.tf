terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true
 
 endpoints {
    s3  = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name != "" ? var.bucket_name : "infra-prova-${random_id.suffix.hex}"
  force_destroy = true
  tags = {
    Name = "infra-prova-bucket"
    Env  = "lab"
  }
}

resource "aws_iam_user" "lab_user" {
  name = "infra_prova_user"
}

output "bucket_name" {
  value = aws_s3_bucket.app_bucket.bucket
}

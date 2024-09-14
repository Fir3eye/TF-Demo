terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "demo-bucket" {
    bucket = "bucket-e334533453sdf"
  
}
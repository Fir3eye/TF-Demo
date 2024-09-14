terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

#random value
resource "random_id" "randid" {
  byte_length = 8

}
#S3 bucket
resource "aws_s3_bucket" "demo" {
  bucket = "my-bucket${random_id.randid.hex}"
}
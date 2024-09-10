terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "public_key" {
  key_name   = "test_key"
  public_key = tls_private_key.rsa.public_key_openssh

}
resource "local_file" "private_key" {
  content         = tls_private_key.rsa.private_key_openssh
  filename        = "test_key.pem"
  file_permission = "0400"
}


resource "aws_instance" "demo" {
    ami = "ami-0522ab6e1ddcc7055"
    instance_type = "t2.micro"    
    key_name = aws_key_pair.public_key.key_name
}
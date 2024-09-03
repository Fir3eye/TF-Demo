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

resource "aws_instance" "demo-server" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"

}

output "public_ip" {
  value = aws_instance.demo-server.public_ip

}
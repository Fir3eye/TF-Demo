terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"

  tags = {
    Name = "Server-${count.index}"
  }
}


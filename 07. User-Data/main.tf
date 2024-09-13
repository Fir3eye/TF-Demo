#Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
#SecurityGroup
resource "aws_security_group" "sg" {
  name = "my-sg"

  #inbound
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }
  #outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

#Ec2 server

resource "aws_instance" "demo" {
  ami                    = "ami-0522ab6e1ddcc7055"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = "${file("script.sh")}"

}
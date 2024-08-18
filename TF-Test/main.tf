terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "instance1" {
  ami           = "ami-06f4fa348c295a6f6" # Ubuntu 24.04 LTS (us-east-1)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "instance1"
  }
}

resource "aws_instance" "instance2" {
  ami           = "ami-06f4fa348c295a6f6" # Ubuntu 24.04 LTS (us-east-1)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "instance2"
  }
}

resource "aws_instance" "instance3" {
  ami           = "ami-06f4fa348c295a6f6" # Ubuntu 24.04 LTS (us-east-1)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "instance3"
  }
}
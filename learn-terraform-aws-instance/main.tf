terraform {
  cloud {
    organization = "coregatekit"
    workspaces {
      name = "learn-terraform-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03fa85deedfcac80b"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

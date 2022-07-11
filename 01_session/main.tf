terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

provider "aws" {
  profile = "inderpalaws03-aws-admin"
  region  = "ap-south-1"
}

variable "instance_type" {
  type = string
}

resource "aws_instance" "test-machine-01" {
  ami           = "ami-068257025f72f470d"
  instance_type = var.instance_type
  tags = {
    Name      = "test-machine-01"
    Owner     = "Inderpal Singh"
    Env       = "Test"
    App       = "Ubuntu-Linux"
    ManagedBy = "Terraform"
  }
}
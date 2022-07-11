terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
      #version = ">=4.22.0"   # In this way, the version can also be specified.
    }
  }
}

provider "aws" {
  # By specifying profile, we declare credentials in config files stored locally,
  # and we refer to those credentials with help of AWS CLI. So, AWS CLI is also
  # needed pre-configured, in this case.
  profile = "inderpalaws03-aws-admin"
  region  = "ap-south-1"
}

resource "aws_instance" "dev-machine-01" {
  ami           = "ami-068257025f72f470d"
  instance_type = "t2.nano"
  tags = {
    Name      = "dev-machine-01"
    Owner     = "Inderpal Singh"
    Env       = "Dev"
    App       = "Ubuntu-Linux"
    ManagedBy = "Terraform"
  }
}
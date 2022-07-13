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

# We define one more provider to create VPC resources in anothet region.
provider "aws" {
  profile = "inderpalaws03-aws-admin"
  region  = "eu-west-1"
  alias   = "europe"
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

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.europe
  }

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  # If we want to create VPC resources of this module in ap-south-1 region, then
  #azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "test-machine-01-public-ip" {
  value = aws_instance.test-machine-01.public_ip
}
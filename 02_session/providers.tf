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

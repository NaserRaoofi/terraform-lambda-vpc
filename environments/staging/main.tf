provider "aws" {
  region = "eu-west-2"  # London region
}

module "vpc" {
  source = "../../modules/vpc"
  
  project_name       = "lambda-vpc-staging"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone  = "eu-west-2a"  # London availability zone
}

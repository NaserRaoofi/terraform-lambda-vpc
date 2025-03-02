provider "aws" {
  region = "eu-west-2"
}

module "vpc" {
  source = "../../modules/vpc"

  project_name         = "lambda-vpc-dev"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr_1 = "10.0.2.0/24"
  private_subnet_cidr_2 = "10.0.3.0/24"
  availability_zones   = ["eu-west-2a", "eu-west-2b"]
  enable_nat_gateway  = true
}

module "security_group" {
  source = "../../modules/security_group"
  
  project_name = "lambda-vpc-dev"
  vpc_id       = module.vpc.vpc_id  # Pass the VPC ID to the security group module
}

module "lambda_function" {
  source = "../../modules/lambda_function"

  project_name       = "lambda-vpc-dev"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.security_group.lambda_sg_id]  # Fetch from security_group module
}

variable "project_name" {
  description = "Name of the project for resource naming"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Lambda function"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the Lambda function"
  type        = list(string)
}


variable "vpc_id" {
  description = "The VPC ID where Lambda is deployed"
  type        = string
}

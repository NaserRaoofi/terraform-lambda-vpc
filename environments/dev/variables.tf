variable "project_name" {
  description = "Name of the project for resource naming"
  type        = string
  default     = "lambda-vpc-dev"  # ✅ Default project name
}

variable "vpc_id" {
  description = "VPC ID where Lambda is deployed"
  type        = string
  default     = ""  # ✅ Leave empty (Terraform will fetch from module)
}

variable "subnet_ids" {
  description = "List of private subnet IDs for the Lambda function"
  type        = list(string)
  default     = []  # ✅ Ensure Terraform does not prompt for this
}

variable "security_group_ids" {
  description = "List of security group IDs for the Lambda function"
  type        = list(string)
  default     = []  # ✅ Ensure Terraform does not prompt for this
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.my_lambda.arn
}
output "lambda_security_group_id" {
  description = "Security group ID of the Lambda function"
  value       = var.security_group_ids[0]  # ✅ Use the security group passed as a variable
}

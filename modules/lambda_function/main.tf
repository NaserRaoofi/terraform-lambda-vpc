resource "aws_lambda_function" "my_lambda" {
  function_name = "${var.project_name}-lambda"
  handler       = "lambda_function.handler"
  runtime       = "nodejs18.x"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "${path.module}/lambda_function.zip"
  timeout       = 10

  vpc_config {
    subnet_ids         = var.subnet_ids  # ✅ Uses private subnets from VPC module
    security_group_ids = var.security_group_ids  # ✅ Uses security group from Security Group module
  }

  tags = {
    Name = "${var.project_name}-lambda"
  }
}


# IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_exec" {
  name = "${var.project_name}-lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

# Attach policies to the role
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_exec.name
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_access" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  role       = aws_iam_role.lambda_exec.name
}

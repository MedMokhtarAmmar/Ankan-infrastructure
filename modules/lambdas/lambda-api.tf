
resource "aws_lambda_function" "api" {
  filename      = var.lambda_file_path
  function_name = var.function_name
  role          = data.terraform_remote_state.roles.outputs.lambda_role
  handler       = "index.handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256(var.lambda_file_path)

  runtime = "nodejs12.x"
  timeout = 50
  environment {
    variables = {
      MONGO_URI = var.string_uri
    }
  }
  publish=true
}
resource "aws_lambda_alias" "api_dev" {
  name             = "dev"
  description      = "Alias for dev"
  function_name    = aws_lambda_function.api.arn
  function_version = "$LATEST"
  depends_on = [aws_lambda_function.api]
}

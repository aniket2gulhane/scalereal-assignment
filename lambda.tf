locals{
    lambda_zip_location = "outputs/lambda_func.zip"
}

data "archive_file" "lambda_func" {
  type        = "zip"
  source_file = "lambda_func.py"
  output_path = local.lambda_zip_location
}

resource "aws_lambda_function" "create_lambda" {
  filename      = local.lambda_zip_location
  function_name = "lambda_func"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_func.import_csv"

  source_code_hash = filebase64sha256(local.lambda_zip_location}

  runtime = "python3.8"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.upload_csv_bucket.arn
}
resource "aws_s3_bucket" "upload_csv_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  tags = {
    Name        = "Upload CSV bucket"
    }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.upload_csv_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.create_lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = ""
    filter_suffix       = ".csv"
  }

}
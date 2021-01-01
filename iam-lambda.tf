resource "aws_iam_role_policy" "lambda_policy" {
  name = "lamba_policy"
  role = aws_iam_role.lambda_role.id

  policy = "${file("iam/lambda-policy.json")}"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = "${file("iam/lambda-assumed-role-policy.json")}"
}
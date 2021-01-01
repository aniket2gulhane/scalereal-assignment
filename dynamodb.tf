resource "aws_dynamodb_table" "emp_table" {
  name           = var.table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "Id"
  range_key      = "Name"

  attribute {
    name = "Id"
    type = "S"
  }

  attribute {
    name = "Name"
    type = "S"
  }
  
  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "emp_table"
  }
}
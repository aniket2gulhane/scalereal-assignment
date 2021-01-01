variable "region" {
  type = string
  description = "Name of a Region"
}

variable "bucket_name" {
  type = string
  description = "Name of a Bucket to upload a CSV file"
}

variable "table_name" {
  type = string
  description = "Name of a DynamoDB Table to import a CSV file"
}

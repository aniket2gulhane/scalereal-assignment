terraform {
  backend "s3" {
    bucket         = "aniket-terraform-backend-state"
    region         = "us-east-1"
    dynamodb_table = "terraform-backend-locks"
    key            = "terraform.tfstate"
    encrypt        = true
  }
}
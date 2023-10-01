terraform {
  backend "s3" {
    bucket         = "terraform-backend-state-buckett"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-state"
  }
}
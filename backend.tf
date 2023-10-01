terraform {
  backend "s3" {
    bucket         = "terraform-bucket-backend-lab1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state"
  }
}
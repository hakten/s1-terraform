provider "aws" {
  region = "us-east-1"
}

terraform {
    backend "s3" {
    bucket = "terraform-tfstate-huseyin"
    key    = "terraform-resources"
    region = "us-east-1"
  }
}

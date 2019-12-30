provider "aws" {
  region = ""
}

terraform {
    backend "s3" {
    bucket = "terraform-tfstate-huseyin"
    key    = ""
    region = "us-east-1"
  }
}

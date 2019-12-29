provider "aws" {
  region = "us-east-2"
}

terraform {
    backend "s3" {
    bucket = "terraform-tfstate-huseyin"
    key    = "p1-terraform"
    region = "us-east-1"
  }
}

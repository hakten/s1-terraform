provider "aws" {
    region = "us-east-1"
}

module "vpc" {
  source = "./module"

cidr        = "10.0.0.0/16"
name        = "Wordpress"
Environment = "Test"
azs         = ["us-east-1a","us-east-1b","us-east-1c"]


}


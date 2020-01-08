provider "aws" {
    region = "us-east-1"
}

module "vpc" {
  source = "./module"

cidr            = "10.0.0.0/16"
name            = "Wordpress"
Environment     = "Test_New"

azs             = ["us-east-1a","us-east-1b","us-east-1c"]
public_subnets  = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
private_subnets = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"]

enable_nat_gateway = var.enable_nat_gateway
enable_vpn_gateway = var.enable_vpn_gateway

tags = {
    Terraform = var.terraform
    Environment = var.environment
  }
}
variable "vpc-cidr-block" {
  default = "10.10.0.0/16"
}

variable "vpc-name" {
  default = "TerraformVPC"
}

variable "az" {
  default = ["us-east-2a","us-east-2b","us-east-2c"]
}


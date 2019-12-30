variable "vpc-cidr-block" {
  default = "10.0.0.0/16"
}

variable "vpc-name" {
  default = "TerraformVPC"
}

variable "pub-cidr" {
  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "priv-cidr" {
  default = ["10.0.11.0/24","10.0.12.0/24","10.0.13.0/24"]
}

variable "az" {
  default = ["us-east-1a","us-east-1b","us-east-1c"]
}
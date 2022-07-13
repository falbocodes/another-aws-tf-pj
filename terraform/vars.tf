terraform {
  backend "s3" {
    bucket         = "420995033334-terraform-states"
    key            = "challenge/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "420995033334-terraform-state-lock"
  }
}

variable "proj-name" {
  default = "challenge"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.12.1"
      
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "us"
}

# Configure the K8 Provider

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

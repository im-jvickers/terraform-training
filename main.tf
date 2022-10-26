terraform {
  backend "remote" {
    organization = "IM-JV-training"

    workspaces {
      name = "jv-terraform-training"
    }

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    region     = "eu-west-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.1"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "secondary"
  region = "eu-west-2"
}
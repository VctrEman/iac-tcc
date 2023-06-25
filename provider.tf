#1 provider per region/cloud company, in this cases 2 AZs

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
 
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
 
}

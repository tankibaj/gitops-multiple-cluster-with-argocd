terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.8.0"
    }
  }
  #  backend "s3" {
  #    bucket         = "naim-terraform"
  #    key            = "aws/management/irsa.tfstate"
  #    dynamodb_table = "naim-terraform"
  #    region         = "eu-central-1"
  #    kms_key_id     = "arn:aws:kms:eu-central-1:000000000000:key/dadsfdsfds-dfdf4-68678-3434j-sfsdfhsk8734394"
  #  }
}

provider "aws" {
  region = "eu-central-1"

  assume_role {
    role_arn = "arn:aws:iam::111111111111:role/OrganizationAccountAccessRole" # management account admin role arn
  }
}
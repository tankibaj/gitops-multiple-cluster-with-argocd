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
  #    key            = "aws/development/iam-role.tfstate"
  #    dynamodb_table = "naim-terraform"
  #    region         = "eu-central-1"
  #    kms_key_id     = "arn:aws:kms:eu-central-1:000000000000:key/dadsfdsfds-dfdf4-68678-3434j-sfsdfhsk8734394"
  #  }
}

provider "aws" {
  region = "eu-central-1"

  assume_role {
    role_arn = "arn:aws:iam::222222222222:role/OrganizationAccountAccessRole" # development account admin role arn
  }
}
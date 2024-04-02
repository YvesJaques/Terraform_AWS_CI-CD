terraform {
    backend "s3" {
        bucket = "cc-tf-state-backend-ci-cd-yves"
        key = "tf-infra/terraform.tfstate"
        region = "sa-east-1"
        dynamodb_table = "terraform-state-locking"
        encrypt = true
    }

    required_version = ">= 0.13.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>3.0"
        }
    }
}

provider "aws" {
    region = "sa-east-1"
}

module "tf-state" {
    source = "./modules/tf-state"
    bucket_name = "cc-tf-state-backend-ci-cd-yves"
}

module "dynamodb-infra" {
    source = "./modules/dynamodb"
}
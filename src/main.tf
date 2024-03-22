terraform {
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
    bucket_name = "cc-tf-state-backend-ci-cd"
}
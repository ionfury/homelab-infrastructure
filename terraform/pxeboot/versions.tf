terraform {
  required_providers {
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.80.0"
    }
  }
}
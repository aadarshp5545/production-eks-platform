terraform {
  backend "s3" {
    bucket  = "eks-adinfra-tfstate"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
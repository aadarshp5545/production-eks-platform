terraform {

  backend "s3" {

    bucket         = ""
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = ""
    encrypt        = true

  }

}
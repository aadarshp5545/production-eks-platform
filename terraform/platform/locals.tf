locals {

  name = "${var.project_name}-${var.environment}"

  common_tags = {

    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"

  }

  vpc_name = "eks-vpc"

  public_subnets = [
    "eks-subnet-public1-us-east-1a",
    "eks-subnet-public2-us-east-1b"
  ]

  private_subnets = [
    "eks-subnet-private1-us-east-1a",
    "eks-subnet-private2-us-east-1b"
  ]

  instance_types = ["t3.medium"]
}
# Existing VPC

data "aws_vpc" "main" {

  filter {

    name   = "tag:Name"
    values = [local.vpc_name]

  }

}

# Public Subnet 1

data "aws_subnet" "public_1" {

  filter {

    name   = "tag:Name"
    values = [local.public_subnets[0]]

  }

}

# Public Subnet 2

data "aws_subnet" "public_2" {

  filter {

    name   = "tag:Name"
    values = [local.public_subnets[1]]

  }

}

# Private Subnet 1

data "aws_subnet" "private_1" {

  filter {

    name   = "tag:Name"
    values = [local.private_subnets[0]]

  }

}

# Private Subnet 2

data "aws_subnet" "private_2" {

  filter {

    name   = "tag:Name"
    values = [local.private_subnets[1]]

  }

}
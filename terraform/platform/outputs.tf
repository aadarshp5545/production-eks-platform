output "vpc_id" {

  value = data.aws_vpc.main.id

}

output "public_subnet_ids" {

  value = [

    data.aws_subnet.public_1.id,
    data.aws_subnet.public_2.id

  ]

}

output "private_subnet_ids" {

  value = [

    data.aws_subnet.private_1.id,
    data.aws_subnet.private_2.id

  ]

}
output "repository_url" {

  value = aws_ecr_repository.this.repository_url

}

output "repository_arn" {

  value = aws_ecr_repository.this.arn

}
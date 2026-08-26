
resource "aws_ecr_repository" "this" {
  name                 = "${local.name}-repository"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name}-repository"
    }
  )
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Automatically expire older images, keeping only the most recent 10 images to control storage costs and maintain a tidy registry"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
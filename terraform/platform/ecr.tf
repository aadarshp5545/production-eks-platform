
module "ecr" {

  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 3.1"

  repository_name = "${local.name}-repository"

  repository_type = "private"

  repository_image_scan_on_push = true

  repository_image_tag_mutability = "MUTABLE"

  repository_force_delete = false

  tags = merge(

    local.common_tags,

    {
      Name = "${local.name}-repository"
    }

  )

}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = "${local.name}-repository"

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

  depends_on = [module.ecr]

}

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
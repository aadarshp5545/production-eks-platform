module "alb" {

  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name = "${local.name}-alb"

  load_balancer_type = "application"

  internal = false

  vpc_id = data.aws_vpc.main.id

  subnets = [

    data.aws_subnet.public_1.id,
    data.aws_subnet.public_2.id

  ]

  create_security_group = false

  security_groups = [

    module.alb_sg.id

  ]

  enable_deletion_protection = false

  target_groups = {

    app = {

      name_prefix = "app"

      protocol = "HTTP"

      port = 8000

      target_type = "ip"

      create_attachment = false

      health_check = {

        enabled = true

        protocol = "HTTP"

        path = "/"

        port = "traffic-port"

        healthy_threshold = 3

        unhealthy_threshold = 3

        timeout = 5

        interval = 30

        matcher = "200"

      }

    }

  }

  listeners = {

    http = {

      port = 80

      protocol = "HTTP"

      forward = {

        target_group_key = "app"

      }

    }

  }

  tags = merge(

    local.common_tags,

    {

      Name = "${local.name}-alb"

    }

  )

}
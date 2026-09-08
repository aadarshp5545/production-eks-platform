module "eks_cluster_sg" {

  source = "./modules/security-group"

  name = "${local.name}-cluster-sg"

  description = "EKS Cluster Security Group"

  vpc_id = data.aws_vpc.main.id

  ingress_rules = [

    {

      description = "Allow All Inbound"

      from_port = 0

      to_port = 0

      protocol = "-1"

      cidr_ipv4 = "0.0.0.0/0"

    }

  ]

  egress_rules = [

    {

      description = "Allow All"

      protocol = "-1"

      cidr_ipv4 = "0.0.0.0/0"

    }

  ]

  tags = merge(

    local.common_tags,
    },
    {
      description = "Allow All Inbound"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_ipv4 = "0.0.0.0/0"
    }
  name = "${local.name}-node-sg"

  description = "EKS Worker Node Security Group"

  vpc_id = data.aws_vpc.main.id

  ingress_rules = [

    {

      description = "Allow All Inbound"

      from_port = 0

      to_port = 0

      protocol = "-1"

      cidr_ipv4 = "0.0.0.0/0"

    }

  ]

  egress_rules = [

    {

      description = "Allow All"

      protocol = "-1"

      cidr_ipv4 = "0.0.0.0/0"

    }

  ]

  tags = merge(

    local.common_tags,

    {

      Name = "${local.name}-node-sg"

    }

  )

}

module "alb_sg" {

  source = "./modules/security-group"

  name = "${local.name}-alb-sg"

  description = "Application Load Balancer Security Group"

  vpc_id = data.aws_vpc.main.id

  ingress_rules = [

    {

      description = "HTTP"

      from_port = 80

      to_port = 80

      protocol = "tcp"

      cidr_ipv4 = "0.0.0.0/0"

    },

    {

      description = "HTTPS"

      from_port = 443

      to_port = 443

      protocol = "tcp"

      cidr_ipv4 = "0.0.0.0/0"

    }
     {

      description = "All"

      from_port = 0

      to_port = 0

      protocol = "-1"

      cidr_ipv4 = "0.0.0.0/0"

    }

  ]

  egress_rules = [

    {

      description = "Allow All"

      protocol = "-1"

      cidr_ipv4 = "0.0.0.0/0"

    }

  ]

  tags = merge(

    local.common_tags,

    {

      Name = "${local.name}-alb-sg"

    }

  )

}


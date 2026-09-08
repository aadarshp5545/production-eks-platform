module "eks_cluster_sg" {
  source      = "./modules/security-group"
  name        = "${local.name}-cluster-sg"
  description = "EKS Cluster Security Group"
  vpc_id      = data.aws_vpc.main.id

  ingress_rules = [
    {
      description = "Allow All Inbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]

  egress_rules = [
    {
      description = "Allow All"
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name}-cluster-sg"
    }
  )
}

# Allow ALB to reach cluster/worker nodes on application port (8000)
resource "aws_security_group_rule" "allow_alb_to_cluster_app" {
  description              = "Allow ALB to reach pods on port 8000"
  type                     = "ingress"
  from_port                = 8000
  to_port                  = 8000
  protocol                 = "tcp"
  security_group_id        = module.eks_cluster_sg.security_group_id
  source_security_group_id = module.alb_sg.security_group_id
}

module "eks_node_sg" {
  source      = "./modules/security-group"
  name        = "${local.name}-node-sg"
  description = "EKS Worker Node Security Group"
  vpc_id      = data.aws_vpc.main.id

  ingress_rules = [
    {
      description = "Allow All Inbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]

  egress_rules = [
    {
      description = "Allow All"
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
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
  source      = "./modules/security-group"
  name        = "${local.name}-alb-sg"
  description = "Application Load Balancer Security Group"
  vpc_id      = data.aws_vpc.main.id

  ingress_rules = [
    {
      description = "Allow All Inbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]

  egress_rules = [
    {
      description = "Allow All"
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name}-alb-sg"
    }
  )
}


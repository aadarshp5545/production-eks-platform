module "eks_cluster" {
  source = "./modules/eks-cluster"

  cluster_name     = local.name
  cluster_version  = "1.29"
  cluster_role_arn = aws_iam_role.eks_cluster.arn
  subnet_ids = [
    data.aws_subnet.private_1.id,
    data.aws_subnet.private_2.id
  ]
  security_group_ids = [module.eks_cluster_sg.id]

  tags = merge(local.common_tags, {
    Name = "${local.name}-cluster"
  })
}

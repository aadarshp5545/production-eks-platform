module "eks_nodegroup" {
  source = "./modules/eks-nodegroup"

  cluster_name    = module.eks_cluster.cluster_name
  node_group_name = "${local.name}-nodegroup"
  node_role_arn   = aws_iam_role.eks_node.arn

  subnet_ids = [
    data.aws_subnet.private_1.id,
    data.aws_subnet.private_2.id
  ]

  desired_size = 2
  min_size     = 2
  max_size     = 4

  instance_types  = ["t3.medium"]

  tags = merge(local.common_tags, {
    Name = "${local.name}-nodegroup"
  })
}

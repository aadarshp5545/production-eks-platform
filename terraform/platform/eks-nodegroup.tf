resource "aws_eks_node_group" "this" {

  cluster_name    = module.eks_cluster.cluster_name
  node_group_name = "${local.name}-nodegroup"

  node_role_arn = aws_iam_role.eks_node.arn

  subnet_ids = [
    data.aws_subnet.private_1.id,
    data.aws_subnet.private_2.id
  ]

  instance_types = local.instance_types

  scaling_config {
    desired_size = 2
    min_size     = 2
    max_size     = 4
  }

  tags = merge(local.common_tags, {
    Name = "${local.name}-nodegroup"
  })

}

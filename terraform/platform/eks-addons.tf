module "eks_addons" {
  source = "./modules/eks-addons"

  cluster_name = module.eks_cluster.cluster_name

  tags = merge(local.common_tags, {
    Name = "${local.name}-addons"
  })
}

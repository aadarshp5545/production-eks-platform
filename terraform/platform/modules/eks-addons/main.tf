resource "aws_eks_addon" "coredns" {

  cluster_name = var.cluster_name

  addon_name = "coredns"

  tags = var.tags

}

resource "aws_eks_addon" "kube_proxy" {

  cluster_name = var.cluster_name

  addon_name = "kube-proxy"

  tags = var.tags

}

resource "aws_eks_addon" "vpc_cni" {

  cluster_name = var.cluster_name

  addon_name = "vpc-cni"

  tags = var.tags

}

resource "aws_eks_addon" "pod_identity_agent" {

  cluster_name = var.cluster_name

  addon_name = "eks-pod-identity-agent"

  tags = var.tags

}

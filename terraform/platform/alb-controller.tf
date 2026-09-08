# Kubernetes ServiceAccount annotated for IRSA
resource "kubernetes_service_account" "alb_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"

    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.alb_controller.arn
    }
  }

  depends_on = [aws_iam_role.alb_controller, module.eks_cluster]
}

resource "helm_release" "aws_load_balancer_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  create_namespace = false

  values = [
    yamlencode({
      clusterName = module.eks_cluster.cluster_name
      region      = var.region
      vpcId       = data.aws_vpc.main.id
      serviceAccount = {
        create = false
        name   = kubernetes_service_account.alb_controller.metadata[0].name
      }
    })
  ]

  depends_on = [kubernetes_service_account.alb_controller]
}

output "addons" {

  value = [

    aws_eks_addon.coredns.id,

    aws_eks_addon.kube_proxy.id,

    aws_eks_addon.vpc_cni.id,

    aws_eks_addon.pod_identity_agent.id

  ]

}

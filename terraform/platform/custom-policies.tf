resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_node_policy" {
  role       = aws_iam_role.eks_node.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_policy" "alb_controller" {

  name = "${local.name}-alb-controller-policy"

  policy = file("${path.module}/iam-policies/AWSLoadBalancerController.json")

}

resource "aws_iam_role_policy_attachment" "alb_controller" {

  role       = aws_iam_role.alb_controller.name
  policy_arn = aws_iam_policy.alb_controller.arn

}

resource "aws_iam_role_policy_attachment" "ebs_csi" {

  role       = aws_iam_role.ebs_csi.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"

}
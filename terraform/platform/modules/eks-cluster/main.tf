resource "aws_eks_cluster" "this" {

  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = var.cluster_role_arn

  enabled_cluster_log_types = var.enabled_cluster_log_types

  vpc_config {

    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids

    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access

  }

  access_config {

    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true

  }

  tags = var.tags

}

data "tls_certificate" "this" {

  url = aws_eks_cluster.this.identity[0].oidc[0].issuer

}

resource "aws_iam_openid_connect_provider" "this" {

  url = aws_eks_cluster.this.identity[0].oidc[0].issuer

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    data.tls_certificate.this.certificates[0].sha1_fingerprint
  ]

  tags = var.tags

}
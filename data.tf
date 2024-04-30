data "tls_certificate" "kaisen-eks-fargate-oidc-tls-certificate" {
  url = aws_eks_cluster.kaisen-eks-fargate.identity[0].oidc[0].issuer
}

data "template_file" "kaisen-eks-fargate-iam-role-oidc" {
  template = file("eks_iam_role_fargate_oidc.json.tpl")

  vars = {
    oidc_arn = aws_iam_openid_connect_provider.kaisen-eks-fargate-oidc.arn
    oidc_url = aws_iam_openid_connect_provider.kaisen-eks-fargate-oidc.url
  }
}

resource "aws_eks_addon" "kaisen-eks-fargate-addon-vpc-cni" {
  cluster_name                = aws_eks_cluster.kaisen-eks-fargate.name
  addon_name                  = "vpc-cni"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_cluster.kaisen-eks-fargate
  ]
}

resource "aws_eks_addon" "kaisen-eks-fargate-addon-kube-proxy" {
  cluster_name                = aws_eks_cluster.kaisen-eks-fargate.name
  addon_name                  = "kube-proxy"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_cluster.kaisen-eks-fargate
  ]
}

resource "aws_eks_addon" "kaisen-eks-fargate-addon-ebs-csi-driver" {
  cluster_name                = aws_eks_cluster.kaisen-eks-fargate.name
  addon_name                  = "aws-ebs-csi-driver"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  service_account_role_arn    = aws_iam_role.kaisen-eks-fargate-iam-role-oidc.arn
  depends_on = [
    aws_eks_cluster.kaisen-eks-fargate
    aws_iam_role.kaisen-eks-fargate-iam-role-oidc
  ]
}

resource "aws_eks_addon" "kaisen-eks-fargate-addon-snapshot-controller" {
  cluster_name                = aws_eks_cluster.kaisen-eks-fargate.name
  addon_name                  = "kube-proxy"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_cluster.kaisen-eks-fargate
  ]
}

resource "aws_eks_addon" "kaisen-eks-fargate-addon-mountpoint-s3-csi-driver" {
  cluster_name                = aws_eks_cluster.kaisen-eks-fargate.name
  addon_name                  = "kube-proxy"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_cluster.kaisen-eks-fargate
  ]
}

resource "aws_eks_addon" "kaisen-eks-fargate-addon-pod-identity-agent" {
  cluster_name                = aws_eks_cluster.kaisen-eks-fargate.name
  addon_name                  = "eks-pod-identity-agent"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_cluster.kaisen-eks-fargate
  ]
}

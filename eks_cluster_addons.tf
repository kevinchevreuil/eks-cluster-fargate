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

resource "aws_eks_fargate_profile" "kaisen-eks-fargate-profile" {
  cluster_name           = aws_eks_cluster.kaisen-eks-fargate.name
  fargate_profile_name   = "Kaisen-EKS-Fargate-Profile"
  pod_execution_role_arn = aws_iam_role.kaisen-eks-run-fargate.arn
  subnet_ids             = [module.aws_compute_base.private-subnet-a, module.aws_compute_base.private-subnet-b, module.aws_compute_base.private-subnet-c]

  selector {
    namespace = "kube-system"
  }
  selector {
    namespace = "default"
  }
  selector {
    namespace = "kaisen"
  }
}

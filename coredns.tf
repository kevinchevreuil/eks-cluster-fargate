resource "null_resource" "patch_coredns_fargate" {
  depends_on = [aws_eks_fargate_profile.kaisen-eks-fargate-profile]
  provisioner "local-exec" {
    command = "aws eks --region ${var.aws_region} update-kubeconfig --name Kaisen-EKS-Fargate && ./coredns.sh"
  }
}

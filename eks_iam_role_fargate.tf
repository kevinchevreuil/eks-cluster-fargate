resource "aws_iam_role" "kaisen-eks-run-fargate" {
  name = "Kaisen_EKS_Run_Fargate"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "ec2.amazonaws.com",
            "eks.amazonaws.com",
            "eks-fargate.amazonaws.com",
            "eks-fargate-pods.amazonaws.com"
          ]
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "kaisen-eks-run-fargate-attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ])
  role       = aws_iam_role.kaisen-eks-run-fargate.name
  policy_arn = each.value
}

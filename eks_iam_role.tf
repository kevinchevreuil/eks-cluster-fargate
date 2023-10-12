resource "aws_iam_role" "kaisen-eks-role-fargate" {
  name = "Kaisen_EKS_Role_Fargate"
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
            "eks-fargate-pods.amazonaws.com",
          ]
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "kaisen-eks-role-fargate-attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSLocalOutpostClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
  ])

  role       = aws_iam_role.kaisen-eks-role-fargate.name
  policy_arn = each.value
}

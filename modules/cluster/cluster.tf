resource "aws_eks_cluster" "eks_cluster" {
  name = "eks-cluster"

  access_config {
    authentication_mode = "API"
  }

  role_arn = aws_iam_role.eks_iam_role.arn
  version  = "1.31"

  vpc_config {
    subnet_ids = [
      var.public_subnet_1a,
      var.public_subnet_1b,
    ]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_attachment,
  ]
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_iam_role.name
}
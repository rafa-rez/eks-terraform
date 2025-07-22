resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.eks_iam_role.arn

  vpc_config {
    subnet_ids = [
      var.public_subnet_1a,
      var.public_subnet_1b
    ]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_attachment
  ]

  tags = merge(
    var.tags,
    {
      Name = "eks-cluster"
    }
  )
}
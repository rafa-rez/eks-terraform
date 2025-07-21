resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.bloco-cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    local.tags,
    {
      Name = "EKS-VPC"

    }
  )
}
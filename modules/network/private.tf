resource "aws_subnet" "eks_subnet_priv_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.bloco-cidr, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    var.tags,
    {
      Name                               = "private-subnet-1a",
      "kubernetes.io/role /internal-elb" = 1

    }
  )
}
resource "aws_subnet" "eks_subnet_priv_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.bloco-cidr, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    var.tags,
    {
      Name                               = "private-subnet-1b",
      "kubernetes.io/role /internal-elb" = 1

    }
  )
}

resource "aws_route_table_association" "eks_rtb_assoc_priv_1a" {
  subnet_id      = aws_subnet.eks_subnet_priv_1a.id
  route_table_id = aws_route_table.eks-private-route_table_1a.id
}

resource "aws_route_table_association" "eks_rtb_assoc_priv_1b" {
  subnet_id      = aws_subnet.eks_subnet_priv_1b.id
  route_table_id = aws_route_table.eks-private-route_table_1a.id
}
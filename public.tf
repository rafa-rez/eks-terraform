resource "aws_subnet" "eks_subnet_pub_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.bloco-cidr, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                      = "public-subnet-1a",
      "kubernetes.io/role /elb" = 1

    }
  )
}
resource "aws_subnet" "eks_subnet_pub_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.bloco-cidr, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                      = "public-subnet-1b",
      "kubernetes.io/role /elb" = 1

    }
  )
}

resource "aws_route_table_association" "eks_rtb_assoc_1a" {
  subnet_id      = aws_subnet.eks_subnet_pub_1a.id
  route_table_id = aws_route_table.eks-public-route_table.id
}

resource "aws_route_table_association" "eks_rtb_assoc_1b" {
  subnet_id      = aws_subnet.eks_subnet_pub_1b.id
  route_table_id = aws_route_table.eks-public-route_table.id
}
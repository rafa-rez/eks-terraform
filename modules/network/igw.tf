resource "aws_internet_gateway" "eks-igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "EKS-IGW"

    }
  )
}

resource "aws_route_table" "eks-public-route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "public-route_table"

    }
  )
}
resource "aws_eip" "eks_ngw_eip_1a" {
  tags = merge(
    var.tags,
    {
      Name = "EKS-EIP-1A"

    }
  )

}

resource "aws_eip" "eks_ngw_eip_1b" {
  tags = merge(
    var.tags,
    {
      Name = "EKS-EIP-1B"

    }
  )

}

resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_pub_1a.id

  tags = merge(
    var.tags,
    {
      Name = "EKS-NGW-1A"

    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_pub_1b.id

  tags = merge(
    var.tags,
    {
      Name = "EKS-NGW-1B"

    }
  )
}

resource "aws_route_table" "eks-private-route_table_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "private-route_table-1a"

    }
  )
}

resource "aws_route_table" "eks-private-route_table_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "private-route_table-1b"

    }
  )
}
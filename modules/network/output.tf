output "subnet_pub_1a" {
  value = aws_subnet.eks_subnet_pub_1a.id
}

output "subnet_pub_1b" {
  value = aws_subnet.eks_subnet_pub_1b.id
}

output "subnet_priv_1a" {
  value = aws_subnet.eks_subnet_priv_1a.id
}

output "subnet_priv_1b" {
  value = aws_subnet.eks_subnet_priv_1b.id
}

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}
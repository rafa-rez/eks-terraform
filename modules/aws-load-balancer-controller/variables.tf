variable "tags" {
  type        = map(any)
  description = "Mapa de tags aplicadas a todos os recursos AWS criados. Utilizadas para organização, controle de custos e políticas de compliance."
}

variable "oidc" {
  type        = string
  description = "URL HTTPS do provedor OIDC do cluster EKS. Necessária para configurar integrações como o AWS Load Balancer Controller com IAM Roles for Service Accounts (IRSA)."
}

variable "cluster_name" {
  type        = string
  description = "Nome do cluster EKS onde os recursos serão instalados e configurados."
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC onde o cluster EKS está provisionado e onde os recursos adicionais serão associados."
}

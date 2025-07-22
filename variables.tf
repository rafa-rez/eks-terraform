variable "bloco-cidr" {
  type        = string
  description = "Bloco de endereçamento CIDR a ser utilizado para a criação da VPC, definindo o escopo da rede privada na AWS."
}

variable "region" {
  type        = string
  description = "Região da AWS onde os recursos serão provisionados. Exemplo: us-east-1, sa-east-1, etc."
}

variable "tags" {
  type        = map(any)
  description = "Mapa de tags aplicadas a todos os recursos AWS criados. Utilizadas para organização, controle de custos e políticas de compliance."
}

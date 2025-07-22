variable "bloco-cidr" {
  type        = string
  description = "Bloco CIDR utilizado para configurações de rede da VPC."
}

variable "tags" {
  type        = map(any)
  description = "Mapa de tags aplicadas a todos os recursos AWS criados. Utilizadas para organização, controle de custos e políticas de compliance."
}

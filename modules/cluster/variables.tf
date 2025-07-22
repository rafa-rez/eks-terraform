variable "tags" {
  type        = map(any)
  description = "Mapa de tags aplicadas a todos os recursos AWS criados. Utilizadas para organização, controle de custos e políticas de compliance."
}

variable "public_subnet_1a" {
  type        = string
  description = "ID da subnet pública na zona de disponibilidade 1a, usada para a criação do cluster EKS."
}

variable "public_subnet_1b" {
  type        = string
  description = "ID da subnet pública na zona de disponibilidade 1b, usada para a criação do cluster EKS."
}

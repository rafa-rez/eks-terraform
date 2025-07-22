variable "tags" {
  type        = map(any)
  description = "Mapa de tags aplicadas a todos os recursos AWS criados. Utilizadas para organização, controle de custos e políticas de compliance."
}

variable "cluster_name" {
  type        = string
  description = "Nome do cluster EKS onde o grupo de nós gerenciados (Managed Node Group) será criado."
}

variable "subnet_private_1a" {
  type        = string
  description = "ID da subnet privada localizada na zona de disponibilidade 1a, usada para provisionamento dos nós do EKS."
}

variable "subnet_private_1b" {
  type        = string
  description = "ID da subnet privada localizada na zona de disponibilidade 1b, usada para provisionamento dos nós do EKS."
}

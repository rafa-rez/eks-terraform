variable "bloco-cidr" {
  type        = string
  description = "Bloco CIDR utilizado para configurações de rede da VPC."
}

variable "tags" {
  type        = map(any)
  description = "Tagas usadas para o desenvolvimento do projeto"

}
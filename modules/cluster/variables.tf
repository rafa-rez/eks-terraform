variable "tags" {
  type        = map(any)
  description = "Tagas usadas para o desenvolvimento do projeto"

}

variable "public_subnet_1a" {
  type        = string
  description = "Subnet para criação do cluster EKS AZ 1a"
}

variable "public_subnet_1b" {
  type        = string
  description = "Subnet para criação do cluster EKS AZ 1b"
}
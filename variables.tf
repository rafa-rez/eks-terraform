variable "bloco-cidr" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}

variable "region" {
  type        = string
  description = "AWS region to create the resources"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to add to all AWS resources"
}
module "eks_network" {
  source     = "./modules/network"
  bloco-cidr = var.bloco-cidr
  tags       = local.tags
}
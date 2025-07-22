module "eks_network" {
  source     = "./modules/network"
  bloco-cidr = var.bloco-cidr
  tags       = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
}
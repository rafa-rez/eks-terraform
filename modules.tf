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

module "eks_managed_node_group" {
  source            = "./modules/managed-node-group"
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  tags              = local.tags
}
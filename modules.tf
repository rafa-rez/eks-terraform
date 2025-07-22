module "eks_network" {
  source     = "./modules/network"
  bloco-cidr = var.bloco-cidr
  tags       = var.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  tags             = var.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
}

module "eks_managed_node_group" {
  source            = "./modules/managed-node-group"
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  tags              = var.tags
}

module "eks_aws_load_balancer_controller" {
  source       = "./modules/aws-load-balancer-controller"
  tags         = var.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
  vpc_id       = module.eks_network.vpc_id
}
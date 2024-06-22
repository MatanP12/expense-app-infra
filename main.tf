
module "network" {
  source             = "./modules/network"
  availability_zones = var.availability_zones
  env                = var.env
  cidr_blocks_public_subnets        = var.cidr_blocks_public_subnets
  cidr_blocks_private_subnets = var.cidr_blocks_private_subnets

}

module "cluster" {
  source             = "./modules/cluster"
  depends_on         = [module.network]
  instance_type      = var.instance_type
  env                = var.env
  vpc_id             = module.network.vpc_id
  availability_zones = var.availability_zones
  subnets_id         = module.network.subnets_id
  min_size           = var.min_size
  max_size           = var.max_size
  desired_size       = var.desired_size
}

module "argocd" {
  source          = "./modules/argocd"
  env             = var.env
  argo_cd_version = var.argo_cd_version
  argo_namespace  = var.argo_namespace
  aws_secretmanager_secret_arn = var.aws_secretmanager_secret_arn
}


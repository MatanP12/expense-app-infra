
module "network" {
  source             = "./modules/network"
  availability_zones = var.availability_zones
  env                = var.env
  cidr_block = var.cidr_block
  num_of_subnets = var.num_of_subnets
  allow_private_subnets = true
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

module "aws_secret" {
  source = "./modules/aws_secret"
  depends_on = [ module.github_deploy_key ]
  repository_ssh = module.github_deploy_key.repository_ssh_url
  env = var.env
  deploy_key = module.github_deploy_key.deploy_key
  secret_name = var.secret_name
}


module "argocd" {
  source          = "./modules/argocd"
  depends_on = [ module.github_deploy_key ]
  env             = var.env
  argo_cd_version = var.argo_cd_version
  argo_namespace  = var.argo_namespace
  aws_secretmanager_secret_arn = module.aws_secret.aws_secretmanager_secret_arn
}

module "github_deploy_key" {
  source = "./modules/github_deploykey"
  repository_name = var.repository_name
  repository_owner = var.repository_owner
  env = var.env
  deploy_key_name = var.deploy_key_name
}

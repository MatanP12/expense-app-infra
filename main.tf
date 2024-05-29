
module "network" {
  source             = "./modules/network"
  availability_zones = var.availability_zones
  env                = var.env
  cidr_blocks        = var.cidr_blocks
  
  
}

module "compute" {
  source             = "./modules/compute"
  depends_on         = [module.network]
  instance_ami       = var.instance_ami
  instance_type      = var.instance_type
  env                = var.env
  subnets            = module.network.subnets
  vpc_id             = module.network.vpc_id
  instance_sg = module.network.instance_sg
  availability_zones = var.availability_zones
}

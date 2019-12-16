provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-central-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "vpc" {
  source = "./modules/vpc"
}

module "asg" {
  source        = "./modules/asg"
  vpc_net10_id = module.vpc.vpc_net10_id
  alb_net10 = module.alb.alb_id
  target_ids = module.asg.target_ids
}

module "alb" {
  source = "./modules/alb"
  subnets_id = module.vpc.subnet_id
  asg_id = module.asg.asg_net10_id

}

module "jenkins-server" {
  source        = "./modules/jenkins-server"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  main-region   = var.main-region
  security_group_id = module.security_groups.security_groups
  subnet_id = module.vpc_main.public_subnet_main

}

module "terraform-node" {
  source        = "./modules/terraform-node"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  main-region   = var.main-region
  subnet_id     = module.eks_vpc.public_subnet
  security_group = module.security_groups.security_groups_eks
  
}

module "maven-sonarqube-server" {
  source            = "./modules/maven-sonarqube-server"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.security_groups.security_groups
  subnet_id         = module.vpc_main.public_subnet_main
  main-region       = var.main-region

#   #   db_name              = var.db_name
#   #   db_username          = var.db_username
#   #   db_password          = var.db_password
#   #   db_subnet_group      = var.db_subnet_group
#   #   db_security_group_id = var.db_security_group_id
}

# module "s3_dynamodb" {
#   source = "./modules/s3-dynamodb"
#   main-region = var.main-region
#   bucket = var.s3_bucket
#   table  = var.table
#   project_name = var.project_name
# }

# #create vpc for eks
module "eks_vpc" {
  source = "./modules/vpc-eks"
  main-region             = var.main-region
  project_name            = var.project_name 
  vpc_cidr                = var.vpc_cidr
  vpc_cidr_private_subnet = var.vpc_cidr_private_subnet
  vpc_cidr_public_subnet  = var.vpc_cidr_public_subnet
  
}
#create vpc for other resources
module "vpc_main" {
  source = "./modules/vpc-main"
  main-region                  = var.main-region
  project_name                 = var.project_name 
  vpc_cidr_main                = var.vpc_cidr_main
  vpc_cidr_private_subnet_main = var.vpc_cidr_private_subnet_main
  vpc_cidr_public_subnet_main  = var.vpc_cidr_public_subnet_main
  
}

#create security group for other resources aside eks
module "security_groups" {
  source = "./modules/security-group"
  vpc_id_main = module.vpc_main.vpc_id_main
  vpc_id_eks = module.eks_vpc.vpc_id
}


module "vpc" {
  source         = "./modules/vpc"
  cluster_name   = var.cluster_name
  vpc_cidr       = var.vpc_cidr
  subnet_newbits = var.subnet_newbits
  tags           = var.tags
}

# Security group for the EC2 jumpbox (SSH access)
module "ec2_security_group" {
  source              = "./modules/security-group"
  security_group_name = "${var.cluster_name}-ec2-sg"
  description         = "Security group for EC2 jumpbox with SSH access"
  vpc_id              = module.vpc.vpc_id
  ingress_rules = {
    ssh = {
      description = "SSH access from anywhere"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
    }
  }
  tags = var.tags
}

module "ec2" {
  source                 = "./modules/ec2"
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids = [module.ec2_security_group.security_group_id]
  key_name               = var.key_name
  user_data_script       = var.user_data_script
  tags                   = var.tags
}

module "eks" {
  source = "./modules/eks"

  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true

  node_group_name           = var.node_group_name
  node_group_instance_types = var.node_group_instance_types
  node_group_desired_size   = var.node_group_desired_size
  node_group_min_size       = var.node_group_min_size
  node_group_max_size       = var.node_group_max_size

  karpenter_chart_version = var.karpenter_chart_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  tags       = var.tags
}

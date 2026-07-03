# ===================== Karpenter Demo Infrastructure =====================
# All values here can be overridden on the CLI with -var or in a
# terraform.tfvars that you customise. The S3 backend bucket below must
# already exist (or be created) before `terraform init`.

# AWS region
region = "us-east-1"

# EKS / VPC naming — every resource is derived from this
cluster_name = "karpenter-demo"

# Networking
vpc_cidr       = "10.0.0.0/16"
subnet_newbits = 8

# EKS cluster
cluster_version           = "1.35"
node_group_name           = "system-node-group"
node_group_instance_types = ["m7i-flex.large"]
node_group_desired_size   = 2
node_group_min_size       = 1
node_group_max_size       = 8

# Karpenter Helm chart version (matches Karpenter v1.x line)
karpenter_chart_version = "1.12.0"

# EC2 jumpbox
ami_id        = "ami-091138d0f0d41ff90"
instance_type = "t3.small"
key_name      = "useast"

# Tags applied to every resource
tags = {
  Terraform = "true"
  Project   = "karpenter-demo"
}

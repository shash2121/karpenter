# VPC
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

# EC2
output "ec2_instance_id" {
  description = "ID of the EC2 jumpbox"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 jumpbox"
  value       = module.ec2.instance_public_ip
}

# EKS
output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_status" {
  description = "Status of the EKS cluster"
  value       = module.eks.cluster_status
}

output "karpenter_node_role_arn" {
  description = "IAM role ARN used by Karpenter-provisioned nodes"
  value       = module.eks.karpenter_node_role_arn
}

output "karpenter_interruption_queue_name" {
  description = "Name of the Karpenter interruption SQS queue"
  value       = module.eks.karpenter_interruption_queue_url
}

# --- kubectl / aws commands to use after apply ---
output "kubeconfig_command" {
  description = "Command to update kubeconfig for the new cluster"
  value       = "aws eks update-kubeconfig --name ${var.cluster_name} --region ${var.region}"
}

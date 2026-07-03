output "cluster_id" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.cluster.id
}

output "cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = aws_eks_cluster.cluster.arn
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.cluster.endpoint
}

output "cluster_certificate_authority_data" {
  description = "The certificate authority data of the EKS cluster"
  value       = aws_eks_cluster.cluster.certificate_authority[0].data
  sensitive   = true
}

output "cluster_status" {
  description = "The status of the EKS cluster"
  value       = aws_eks_cluster.cluster.status
}

output "cluster_security_group_id" {
  description = "The cluster security group ID created by EKS"
  value       = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
}

output "node_group_id" {
  description = "The ID of the EKS node group"
  value       = aws_eks_node_group.node_group.id
}

output "node_group_status" {
  description = "The status of the EKS node group"
  value       = aws_eks_node_group.node_group.status
}

output "node_group_role_arn" {
  description = "The ARN of the IAM role used by the managed node group"
  value       = aws_iam_role.node_group.arn
}

output "karpenter_controller_role_arn" {
  description = "The ARN of the Karpenter controller IAM role"
  value       = aws_iam_role.karpenter_controller.arn
}

output "karpenter_node_role_arn" {
  description = "The ARN of the Karpenter node IAM role"
  value       = aws_iam_role.karpenter_node.arn
}

output "karpenter_interruption_queue_url" {
  description = "The URL of the Karpenter interruption SQS queue"
  value       = aws_sqs_queue.karpenter_interruption.url
}

output "karpenter_interruption_queue_arn" {
  description = "The ARN of the Karpenter interruption SQS queue"
  value       = aws_sqs_queue.karpenter_interruption.arn
}

output "karpenter_helm_release_status" {
  description = "The status of the Karpenter Helm release"
  value       = helm_release.karpenter.status
}

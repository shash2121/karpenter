variable "region" {
  description = "AWS region to deploy all resources"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster (also used for VPC/subnet naming and tagging)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_newbits" {
  description = "Number of bits to add for subnetting (8 = /24 from /16)"
  type        = number
  default     = 8
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.31"
}

variable "node_group_name" {
  description = "Name of the managed node group (hosts system pods)"
  type        = string
  default     = "system-node-group"
}

variable "node_group_instance_types" {
  description = "Instance types for the managed node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_desired_size" {
  description = "Desired number of nodes in the managed node group"
  type        = number
  default     = 2
}

variable "node_group_min_size" {
  description = "Minimum number of nodes in the managed node group"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Maximum number of nodes in the managed node group"
  type        = number
  default     = 3
}

variable "karpenter_chart_version" {
  description = "Version of the Karpenter Helm chart to deploy"
  type        = string
  default     = "1.12.0"
}

variable "ami_id" {
  description = "AMI ID for the EC2 jumpbox (Ubuntu 22.04 LTS)"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 jumpbox"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Key pair name for SSH access to the EC2 jumpbox"
  type        = string
}

variable "user_data_script" {
  description = "User data script for the EC2 jumpbox"
  type        = string
  default     = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo chmod 777 /var/run/docker.sock
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
EOF
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Terraform = "true"
    Project   = "karpenter-demo"
  }
}

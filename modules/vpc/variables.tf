variable "cluster_name" {
  description = "EKS cluster name used for subnet tagging"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_newbits" {
  description = "Number of new bits to add to VPC CIDR to generate subnets (8 = /24 from /16)"
  type        = number
  default     = 8
}

variable "tags" {
  description = "Global tags to apply to all resources"
  type        = map(string)
  default = {
    Terraform = "true"
  }
}

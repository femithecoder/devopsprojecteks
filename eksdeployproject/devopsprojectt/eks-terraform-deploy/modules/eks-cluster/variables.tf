################################################################################
# General Variables from root module
################################################################################
variable "cluster_name" {
  type    = string
  default = "eks-cluster"
}

################################################################################
# Variables from other Modules
################################################################################

variable "vpc_id" {
  description = "VPC ID which EKS cluster is deployed in"
  type        = string
}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(any)
  }

################################################################################
# Variables defined using Environment Variables
################################################################################

variable "rolearn" {
  description = "Add admin role to the aws-auth configmap"
  type = string
  default = "arn:aws:iam::548570664128:role/ec2-connect"
}

variable "main-region" {
  default = "eu-west-2"
}

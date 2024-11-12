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
  default = "vpc-0e651b74bcad86f27"
}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(any)
  default = [ "subnet-06cf6c2e05d8e1cad","subnet-0de3efc28813a5813" ]
}

################################################################################
# Variables defined using Environment Variables
################################################################################

variable "rolearn" {
  description = "Add admin role to the aws-auth configmap"
  type = string
}

variable "main-region" {
  default = "eu-west-2"
}

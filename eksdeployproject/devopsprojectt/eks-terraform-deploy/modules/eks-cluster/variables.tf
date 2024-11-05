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
  default = "vpc-0d08fd8fcd58772d7"
}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(any)
  default = [ "subnet-07b6dd674426d566a","subnet-03af90d812469d045" ]
}

################################################################################
# Variables defined using Environment Variables
################################################################################

variable "rolearn" {
  description = "Add admin role to the aws-auth configmap"
}

variable "main-region" {
  default = "eu-west-2"
}

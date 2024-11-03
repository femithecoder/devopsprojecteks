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
  default = "vpc-06551eaddbdc50c0f"
}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(string)
  default = ["subnet-02fb3471f7ccfbafa"]
}

################################################################################
# Variables defined using Environment Variables
################################################################################

variable "rolearn" {
  description = "Add admin role to the aws-auth configmap"
}


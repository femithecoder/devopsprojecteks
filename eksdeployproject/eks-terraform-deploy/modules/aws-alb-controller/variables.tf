################################################################################
# General Variables from root module
################################################################################

variable "main-region" {
  type    = string
  default = "eu-west-2"
}

variable "env_name" {
  type = string
}

variable "cluster_name" {
  type = string
  default = "eks-cluster"
}

################################################################################
# Variables from other Modules
################################################################################

variable "vpc_id" {
  description = "VPC ID which Load balancers will be  deployed in"
  type        = string
  default = "vpc-06551eaddbdc50c0f"
}

variable "oidc_provider_arn" {
  description = "OIDC Provider ARN used for IRSA "
  type        = string
}

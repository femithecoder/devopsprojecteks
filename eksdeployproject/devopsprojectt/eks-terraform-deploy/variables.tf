
# ################################################################################
# # Default Variables
# ################################################################################

variable "main-region" {
  type    = string
  default = "eu-west-2"
}


# ################################################################################
# # EKS Cluster Variables
# ################################################################################

variable "cluster_name" {
  type    = string
  default = "eks-cluster"
}

variable "rolearn" {
  description = "Add admin role to the aws-auth configmap"
  default     = "arn:aws:iam::548570664128:role/ec2-connect"
}

# ################################################################################
# # ALB Controller Variables
# ################################################################################

variable "env_name" {
  type    = string
  default = "dev"
}

################################################################################
# EKS Cluster Variables for grafana and prometheus deployment
################################################################################

# variable "cluster_endpoint" {
#   type        = string
#   sensitive   = true
#   description = "The cluster endpoint"
# }

# variable "cluster_certificate_authority_data" {
#   type        = string
#   sensitive   = true
#   description = "The Cluster certificate data"
# }

# variable "oidc_provider_arn" {
#   description = "OIDC Provider ARN used for IRSA "
#   type        = string
#   sensitive   = true
# }

# ################################################################################
# # VPC Variables
# ################################################################################

# variable "vpc_id" {
#   description = "VPC ID which Load balancers will be  deployed in"
#   type        = string
# }

# variable "private_subnets" {
#   description = "A list of private subnets"
#   type        = list(string)
# }

################################################################################
# AWS SSO Variables
################################################################################

# variable "sso_admin_group_id" {
#   description = "AWS_SSO Admin Group ID"
#   type        = string
#   sensitive   = true
#   default     = "b4f8f4f8-e011-7046-0637-993dc10edd76"
# }

# variable "vpc_id" {
#   description = "VPC ID which EKS cluster is deployed in"
#   type        = string
#   default = "vpc-0e651b74bcad86f27"
# }

# variable "private_subnets" {
#   description = "VPC Private Subnets which EKS cluster is deployed in"
#   type        = list(any)
#   default = [ "subnet-06cf6c2e05d8e1cad","subnet-0de3efc28813a5813" ]
# }
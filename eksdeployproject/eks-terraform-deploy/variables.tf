
# ################################################################################
# # Default Variables
# ################################################################################

variable "main-region" {
  type    = string
  default = "eu-west-2"
}
variable "vpc_cidr_main" {
  default = "100.0.0.0/16"
}
variable "vpc_cidr_public_subnet_main" {
  default = "100.0.1.0/24"
}
variable "vpc_cidr_private_subnet_main" {
  default = "100.0.0.0/24"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "vpc_cidr_public_subnet" {
  default = "10.0.0.0/24"
}
variable "vpc_cidr_private_subnet" {
  default = "10.0.1.0/24"
}

variable "project_name" {
  default = "eks_deploy"
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
  default     = "arn:aws:iam::322266404742:role/terraform-create-role"
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

variable "vpc_id" {
  description = "VPC ID which Load balancers will be  deployed in"
  type        = string
  default = "vpc-06551eaddbdc50c0f"
}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(string)
  default = ["subnet-02fb3471f7ccfbafa"]
}

################################################################################
# AWS SSO Variables
################################################################################

# variable "sso_admin_group_id" {
#   description = "AWS_SSO Admin Group ID"
#   type        = string
#   sensitive   = true
#   default     = "b4f8f4f8-e011-7046-0637-993dc10edd76"
# }


variable "ami_id" {
  default = "ami-0e8d228ad90af673b"
}
variable "instance_type" {
  default = "t2.large"
}
variable "key_name" {
  default = "my-key-pair"
}
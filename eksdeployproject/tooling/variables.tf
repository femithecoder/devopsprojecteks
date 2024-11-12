variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
# variable "security_group_id" {
#   default = 
# }
variable "project_name" {}
variable "vpc_cidr" {}
variable "vpc_cidr_public_subnet" {}
variable "vpc_cidr_private_subnet" {}
variable "vpc_cidr_private_subnet_01" {}
variable "s3_bucket" {
  description = "The name of the S3 bucket for storing Terraform state"
  type        = string
  default     = "terraform-backend-bucket-eks-deploy-01"
}

variable "table" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-lock-table"
}

variable "main-region" {}
#variable "vpc_id_main" {}
variable "vpc_cidr_main" {}
variable "vpc_cidr_public_subnet_main" {}
variable "vpc_cidr_private_subnet_main" {}
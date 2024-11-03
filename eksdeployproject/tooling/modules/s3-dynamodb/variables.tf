variable "bucket" {
  default = "terraform-backend-bucket-eks-deploy-01"
}
variable "table" {
  default = "terraform-lock-table"
}
variable "main-region" {
  default = "eu-west-2"
}
variable "project_name" {
  type    = string
  default = "Address Book deployment using eks"
}

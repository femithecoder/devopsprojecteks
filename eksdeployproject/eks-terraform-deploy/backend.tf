terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    key            = "tooling/terraform.state"
    bucket         = "terraform-backend-bucket-eks-deploy-01"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock-table"
    # profile = "value"
  }
}
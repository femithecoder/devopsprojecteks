variable "ami_id" {}

variable "instance_type_extra" {}

variable "key_name" {}

variable "main-region" {}

variable "security_group_id" {}

variable "subnet_id" {}

# variable "db_name" {
#   description = "The name of the PostgreSQL database"
#   type        = string
# }

# variable "db_username" {
#   description = "The username for the PostgreSQL database"
#   type        = string
# }

# variable "db_password" {
#   description = "The password for the PostgreSQL database"
#   type        = string
#   sensitive   = true
# }

# variable "db_security_group_id" {
#   description = "The security group ID for the PostgreSQL database"
#   type    = list(string)
# }

# variable "db_subnet_group" {
#   description = "The subnet group for the PostgreSQL database"
#   type        = string
# }

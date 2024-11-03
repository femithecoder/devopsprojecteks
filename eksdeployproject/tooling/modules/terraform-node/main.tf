resource "aws_instance" "terraform_node" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("${path.module}/terraform.sh")
  subnet_id     = var.subnet_id
  security_groups = [ var.security_group ]
  
  tags = {
    Name = "terraform-node"
  }
  lifecycle {
    prevent_destroy = false
  }
}
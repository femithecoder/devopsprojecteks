resource "aws_instance" "docker" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups      = [var.security_group_id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  user_data                   = file("${path.module}/docker.sh")
  
  tags = {
    Name = "Docker-Server"
  }
  lifecycle {
    prevent_destroy = false
  }
}

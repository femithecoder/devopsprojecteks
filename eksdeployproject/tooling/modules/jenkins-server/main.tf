resource "aws_instance" "jenkins_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("${path.module}/jenkins.sh")
  security_groups = [ var.security_group_id ]
  subnet_id = var.subnet_id
  
  tags = {
    Name = "jenkins-server"
  }
}

#!/bin/bash

#Installing kubectl client
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.12/2024-04-19/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH


# Update the package repository and install necessary dependencies
sudo apt update -y
sudo apt install -y wget unzip

#Installing aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Amazon Corretto 17 (Java 17)
sudo apt install openjdk-17-jdk -y

# Update existing package list
sudo apt update -y

# Install prerequisite packages for Docker
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list to include Docker packages
sudo apt update -y

# Install Docker Engine
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Enable Docker to start on boot
sudo systemctl enable docker

# Start Docker service
sudo systemctl start docker

# Verify Docker installation
sudo docker --version

# Optional: Add the current user to the 'docker' group to avoid using 'sudo' for Docker commands
sudo usermod -aG docker $USER

echo "Docker installation completed successfully."
echo "Please log out and log back in to apply group changes."

# # Install Nginx
# sudo apt install nginx -y

# # Adjust the firewall to allow HTTPS traffic
# sudo ufw allow 'Nginx Full'

# # Install Certbot and Nginx plugin for Let's Encrypt
# sudo apt install certbot python3-certbot-nginx -y

# # Create an Nginx configuration for sonarqube reverse proxy
# sudo tee /etc/nginx/sites-available/sonarqube.conf > /dev/null <<EOL
# server {
#     listen 80;
#     server_name docker.olorunfemilawal.com;

#     location / {
#         proxy_pass http://localhost:9000;
#         proxy_set_header Host \$host;
#         proxy_set_header X-Real-IP \$remote_addr;
#         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
#         proxy_set_header X-Forwarded-Proto \$scheme;
#     }
# }
# EOL

# # Enable the docker Nginx configuration
# sudo ln -s /etc/nginx/sites-available/sonarqube.conf /etc/nginx/sites-enabled/

# # Test Nginx configuration
# sudo nginx -t

# # Reload Nginx to apply changes
# sudo systemctl reload nginx

# # Obtain an SSL certificate using Certbot and configure Nginx
# sudo certbot --nginx -d sonarqube.olorunfemilawal.com --email femithecoder@gmail.com --non-interactive --agree-tos --redirect

# # Setup a cron job to automatically renew the certificate
# echo "0 0 * * * /usr/bin/certbot renew --quiet" | sudo tee -a /etc/crontab > /dev/null

# # Restart Nginx to apply SSL configuration
# sudo systemctl restart nginx

# echo "docker is now accessible via https://docker.olorunfemilawal.com"




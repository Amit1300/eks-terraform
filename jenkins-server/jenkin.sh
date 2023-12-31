#!/bin/bash

# Updates the EC2 Instance
sudo apt-get update -y

# Installs a Java implementation (OpenJDK 11 JRE)
sudo apt-get install openjdk-11-jre -y

# Adds the Jenkins repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Updates package list
sudo apt-get update -y

# Installs required dependencies for Jenkins
sudo apt-get install fontconfig -y

# Installs Jenkins
sudo apt-get install jenkins -y

# Starts and enables Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Install Git
sudo apt install -y git

# Install Terraform
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.9
wget https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip
unzip terraform_1.1.4_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_1.1.4_linux_amd64.zip

# Install kubectl
sudo snap install kubectl --classic

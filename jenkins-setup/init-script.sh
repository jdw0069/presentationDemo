#!/bin/bash
sudo yum update
sudo yum upgrade -y
sudo yum install git -y
sudo yum install docker -y
sudo systemctl start docker
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo amazon-linux-extras install epel -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

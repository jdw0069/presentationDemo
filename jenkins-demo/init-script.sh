#!/bin/bash
sudo yum update
sudo yum upgrade -y
sudo yum install docker -y
sudo systemctl start docker
sudo docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11
#!/bin/bash
sudo yum update
sudo yum upgrade -y
sudo yum install docker -y
sudo systemctl start docker
sudo docker run --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts
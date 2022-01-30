terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
}

//ec2 instance
resource "aws_instance" "jenkins_ec2" {
    ami = "ami-04505e74c0741db8d" //need to change depending on region
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
    subnet_id = aws_subnet.jenkins-subnet.id
    key_name = "jenkins-key"
  

    tags = {
        Name = "jekins-ec2"
    }
}

//create key pair to connect to ec2
resource "aws_key_pair" "jenkins-key" {
  key_name   = "jenkins-key"
  public_key = file("/Users/jdw/Desktop/presentationResources/jenkins-key.pub")
}



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
    ami = "ami-0a8b4cd432b1c3063" //need to change depending on region (must be Amazon Linux AMI)
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
    subnet_id = aws_subnet.jenkins-subnet.id
    key_name = "jenkins-key"
    user_data = file("/Users/jdw/Desktop/presentationDemo/jenkins-demo/init-script.sh")
  

    tags = {
        Name = "jekins-ec2"
    }
}

//create key pair to connect to ec2
resource "aws_key_pair" "jenkins-key" {
  key_name   = "jenkins-key"
  public_key = file("/Users/jdw/Desktop/presentationResources/jenkins-key.pub")
}

//output for ipv4 dns address to connect to jenkins
//must run "terraform refresh" command since ip allocation is dynamic
output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.jenkins_ec2.public_dns
}



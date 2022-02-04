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

resource "aws_instance" "demo_ec2" {
    ami = "ami-0a8b4cd432b1c3063"
    instance_type = "t2.micro"

    tags = {
        Name = "Terraform_Demo_ec2"
    }
}

resource "aws_s3_bucket" "demo_s3" {
  bucket = "auburn-demo-bucket"
  acl    = "public-read-write"

  tags = {
    Name = "Terrafrom_Demo_s3"
  }
}

resource "aws_s3_bucket_object" "demo_s3_upload" {
  bucket = aws_s3_bucket.demo_s3.id
  key = "picture.jpeg"
  acl = "public-read"
  content_type = "image/jpeg"
  content_disposition = "inline; filename=picture.jpeg"
  source = "./picture.jpeg" //change source
}


provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
}

#demo
resource "aws_s3_bucket" "testbucket" {
    bucket = "someauburntestbucket"
    acl = "public-read-write"
    versioning {
      enabled = false
     
    }
  
}

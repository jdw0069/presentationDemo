provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
}

resource "aws_s3_bucket" "testbucket" {
    bucket = "someauburntestbucket"
    acl = "public-read"
    versioning {
      enabled = true
      mfa_delete = true
    }
  
}

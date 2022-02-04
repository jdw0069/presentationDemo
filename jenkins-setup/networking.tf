resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "jenkins-vpc"
  }
}

//create subnets
resource "aws_subnet" "jenkins-subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "jenkins-subnet"
  }
}

//get public ip for security groups
data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://ipinfo.io/json'"]
}

//security group
resource "aws_security_group" "jenkins-sg" {
  name = "jenkins-security group"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [format("%s/%s",data.external.myipaddr.result.ip,"32")]
   
  }
  
  ingress {
    description      = "Jenkins web server"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [format("%s/%s",data.external.myipaddr.result.ip,"32")]
   
  }
  //removes default rule
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "jenkins-security-group"
  }
}

//give instance public-ip
resource "aws_eip" "jenkins-eip" {
  instance = aws_instance.jenkins_ec2.id
  vpc      = true
}

//internet gateway
resource "aws_internet_gateway" "jenkins-igw" {
  vpc_id = aws_vpc.my_vpc.id
tags = {
    Name = "jenkins-internet-gateway"
  }
}

//route tables and attach igw
resource "aws_route_table" "jenkins-rt" {
  vpc_id = aws_vpc.my_vpc.id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins-igw.id
  }
tags = {
    Name = "jenkins-route-table"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.jenkins-subnet.id
  route_table_id = aws_route_table.jenkins-rt.id
}

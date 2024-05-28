provider "aws" {
  
  region     = "us-east-1"  # Update with your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-07caf09b362be10b8"
  instance_type = "t2.micro"
  
  security_groups = [aws_security_group.test-sg.name]
  key_name      = "demo1"

  tags = {
    name = "ExampleInstance"
  }
}
resource "aws_security_group" "test-sg" {
  name = "Test_Security_Group"
  vpc_id = "vpc-037fe64dfd4af7a46"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

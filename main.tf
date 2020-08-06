provider "aws" {
  region = "us-gov-west-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

// subnet-ce6c82a9
// subnet-c60e739f
// subnet-fcda2fb5
resource "aws_instance" "app" {
  count = 3

  ami = "ami-adecdbcc"
  instance_type = "t2.micro"
  subnet_id = "subnet-ce6c82a9"
  tags = {
    Name = "andrews app"
  }
}
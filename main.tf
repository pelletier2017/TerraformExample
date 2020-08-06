provider "aws" {
  alias = "gov-west"
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

module "high_altitude" {
  source  = "terraform.cie.vi2e.io/High-Altitude/high-altitude/aws"
  version = "1.0.12"
  providers = {
    aws = aws.gov-west
  }
  region = "us-gov-west-1"
  app_tpl_filepath_filename = "templates/app.tpl"
  app_version = "1.25.0"
  application_name = "andrew-soaesb"
  aws_ami = "ami-adecdbcc"
  http_proxy = "internal-transit-s-rELBProx-PEHFQP9VW7UJ-653953035.us-gov-west-1.elb.amazonaws.com:3128"
  private_subnets = ["subnet-ce6c82a9", "subnet-c60e739f", "subnet-fcda2fb5"]
  public_subnets = []
  vpc_id = "vpc-30686a54"
  NEXUS_USERNAME = "${var.NEXUS_USERNAME}"
  NEXUS_PASSWORD = "${var.NEXUS_PASSWORD}"
}

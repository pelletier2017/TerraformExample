provider "aws" {
  alias = "gov-west"
  region = "us-gov-west-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

module "high_altitude" {
  source  = "terraform.cie.vi2e.io/High-Altitude/high-altitude/aws"
  version = "~>1.0.15"
  providers = {
    aws = aws.gov-west
  }
  app_tpl_filepath_filename = "templates/app.tpl"
  app_version = "1.25.0"
  application_name = "andrew-soaesb"
  aws_ami = "ami-adecdbcc"
  http_proxy = "internal-transit-s-rELBProx-PEHFQP9VW7UJ-653953035.us-gov-west-1.elb.amazonaws.com:3128/"
  private_subnets = ["subnet-ce6c82a9", "subnet-c60e739f", "subnet-fcda2fb5"]
  public_subnets = ["subnet-c97e90ae", "subnet-0037c249", "subnet-c404799d"]
  vpc_id = "vpc-30686a54"
  NEXUS_USERNAME = "${var.NEXUS_USERNAME}"
  NEXUS_PASSWORD = "${var.NEXUS_PASSWORD}"
  ssh_cidrs = ["10.0.0.0/8"]
}

terraform {
  backend "s3" {
    bucket       = "dpp-learning-terraform-state-bucket"
    key          = "ec2/terraform.tfstate"
    use_lockfile = true
    region       = "us-east-1"
    encrypt      = true
  }
}



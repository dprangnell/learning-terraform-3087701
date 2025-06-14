terraform {
  backend "s3" {
    bucket       = "dpp-learning-terraform-state-bucket"
    key          = "s3/example3b/terraform.tfstate"
    use_lockfile = true
    region       = "us-east-1"
    encrypt      = true
  }
}

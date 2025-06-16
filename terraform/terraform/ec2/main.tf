module "ec2" {
  source = "../../modules/ec2"

  network_remote_state_key = "network/terraform.tfstate"

  providers = {
    aws = aws
  }
}


module "ec2" {
  source = "../../modules/ec2"

  sg_remote_state_key = "network/terraform.tfstate"
}


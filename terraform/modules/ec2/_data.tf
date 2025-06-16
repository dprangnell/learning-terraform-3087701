data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_deets.name]
    #["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  #owners = ["979382823631"] # Bitnami
  owners = [var.ami_deets.owner] # Bitnami
}

data "terraform_remote_state" "security_group" {
  backend = "s3"

  config = {
    bucket = local.custom_network_remote_state.bucket
    key    = local.custom_network_remote_state.key
    region = local.custom_network_remote_state.region
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = local.custom_network_remote_state.bucket
    key    = local.custom_network_remote_state.key
    region = local.custom_network_remote_state.region
  }
}

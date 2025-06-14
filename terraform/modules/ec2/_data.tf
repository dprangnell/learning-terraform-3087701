data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

data "terraform_remote_state" "security_group" {
  backend = "s3"

  config = {
    bucket = var.sg_remote_state_bucket
    key    = var.sg_remote_state_key
    region = var.sg_remote_state_region
  }
}

module "security-group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.3.0"
  name        = var.sg_name
  description = var.sg_description

  #vpc_id = data.aws_vpc.default.id
  vpc_id = module.vpc.vpc_id

  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.env
  cidr = "10.0.0.0/16"

  azs             = var.vpc_azs
  #  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  #enable_nat_gateway = true
  #enable_vpn_gateway = true

  tags = local.combined_tags
}

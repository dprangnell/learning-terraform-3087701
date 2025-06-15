module "security-group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.3.0"
  name        = var.sg_name
  description = var.sg_description

  vpc_id = data.aws_vpc.default.id

  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}

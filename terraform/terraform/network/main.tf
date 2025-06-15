module "sg" {
  source = "../../modules/network/"

  sg_name = var.sg_name

  providers = {
    aws = aws
  }
}

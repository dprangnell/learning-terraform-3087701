module "s3" {
  source = "../../modules/s3/"

  providers = {
    aws = aws 
  }
}

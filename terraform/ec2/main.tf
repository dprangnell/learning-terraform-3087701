resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags   = local.combined_tags
}

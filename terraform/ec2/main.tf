resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

  tags   = local.combined_tags
}

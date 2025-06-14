resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

  vpc_security_group_ids = [data.terraform_remote_state.security_group.outputs.id]

  tags   = local.combined_tags
}

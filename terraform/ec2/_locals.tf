locals {
  default_tags = {
    Name = "HelloWorld"
  }

  combined_tags = merge(local.default_tags, var.tags)
}

locals {
  default_tags = {
    Module = "network"
    Env = var.env
  }

  combined_tags = merge(local.default_tags, var.tags)
}

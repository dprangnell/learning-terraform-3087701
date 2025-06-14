locals {
  default_tags = {
    Module = "network"
  }

  combined_tags = merge(local.default_tags, var.tags)
}

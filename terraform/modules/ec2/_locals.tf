locals {
  default_tags = {
    Name = "HelloWorld"
  }

  combined_tags = merge(local.default_tags, var.tags)
}

locals {
  default_network_remote_state = {
    bucket = "dpp-learning-terraform-state-bucket"
    key    = null
    region = "us-east-1"
  }

  custom_network_remote_state = merge(
    local.default_network_remote_state,
    {
      key = var.network_remote_state_key
    }
  )

}

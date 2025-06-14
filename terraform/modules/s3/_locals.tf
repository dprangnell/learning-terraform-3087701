locals {
  default_tags = {
    BucketName = var.bucket_name
  }

  combined_tags = merge(local.default_tags, var.tags)
}

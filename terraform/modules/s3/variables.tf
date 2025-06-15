variable "bucket_name" {
  description = "Name of bucket"
  type        = string
  default     = "dpp-examples3-20260613-bucket"
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}

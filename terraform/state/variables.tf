variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of bucket"
  type        = string
  default     = "dpp-learning-terraform-state-bucket"
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}

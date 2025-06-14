variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = null
}

variable "sg_description" {
  description = "Security group description"
  type        = string
  default     = null
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}

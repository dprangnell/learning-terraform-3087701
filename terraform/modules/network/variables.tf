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

variable "env" {
  type = string
  default = "dev"
}

variable "vpc_azs" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

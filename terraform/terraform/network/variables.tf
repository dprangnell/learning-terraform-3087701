variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "sg_name" {
  type    = string
  default = "blog"
}

variable "sg_description" {
  type = string
  default = "Allow http and https in. Allow everything out"
}

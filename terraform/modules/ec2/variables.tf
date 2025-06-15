variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "instance_count" {
  description = "Number of instances"
  type        = number
  default     = 1
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}

variable "network_remote_state_bucket" {
  type    = string
  default = "dpp-learning-terraform-state-bucket"
}

variable "network_remote_state_key" {
  type = string
}

variable "network_remote_state_region" {
  type    = string
  default = "us-east-1"
}

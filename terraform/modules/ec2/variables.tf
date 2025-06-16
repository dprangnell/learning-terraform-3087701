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

variable "network_remote_state_key" {
  description = "Details on the remote state for the network tf"

  type    = string
  default = null
}

variable "ami_deets" {
  description = "details for the latest tomcat ami by bitnami"

  type = object({
    name  = string
    owner = string
  })

  default = {
    name  = "bitnami-tomcat-*-x86_64-hvm-ebs-nami"
    owner = "979382823631" # Bitnami
  }
}

variable "environment" {
  type = object({
    name           = string
    network_prefix = string
  })
  default = {
    name           = "example-sg"
    network_prefix = "10.0"
  }
}

variable "min_size" {
  type    = string
  default = 1
}

variable "max_size" {
  type    = string
  default = 2
}

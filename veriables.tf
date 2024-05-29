variable "tags" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "cidr_blocks" {
  type = list(string)
}

# variable "access_key" {
#   type = string
# }

# variable "secret" {
#   type = string
  
# }
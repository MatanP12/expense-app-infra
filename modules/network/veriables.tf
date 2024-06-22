variable "availability_zones" {
  type = list(string)
}


variable "env" {
  type = string
}

variable "cidr_blocks_public_subnets" {
  type = list(string)
}

variable "cidr_blocks_private_subnets" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "num_of_subnets" {
  type = number
}

variable "allow_private_subnets" {
  type = bool
}
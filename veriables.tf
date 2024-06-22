variable "tags" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "instance_type" {
  type = string
}

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

variable "argo_cd_version" {
  type = string

}

variable "argo_namespace" {
  type = string
}

variable "desired_size" {
  type = number
}


variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "aws_secretmanager_secret_arn" {
  type = string
}
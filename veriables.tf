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

variable "repository_owner" {
  type = string
}

variable "repository_name" {
  type = string
}

variable "deploy_key_name" {
  type = string
}

variable "access_token" {
  type = string
  sensitive = true
}

variable "secret_name" {
  type = string
}

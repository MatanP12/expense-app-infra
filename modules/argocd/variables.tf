variable "env" {
  type = string
}

variable "argo_cd_version" {
  type = string
}

variable "argo_namespace" {
  type = string
}


variable "aws_secretmanager_secret_arn" {
  type = string
  sensitive = true
}
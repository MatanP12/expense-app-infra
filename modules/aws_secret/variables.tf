variable "repository_ssh" {
    type = string
    sensitive = true
}

variable "deploy_key" {
  type = string
  sensitive = true
}

variable "secret_name" {
  type = string
}

variable "env" {
  type = string
}
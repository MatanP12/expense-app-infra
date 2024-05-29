variable "instance_type" {
  type    = string
}

variable "instance_ami" {
  type    = string
}


variable "env" {
    type = string
}

variable "subnets" {
}

variable "vpc_id" {
    type = string
}

variable "instance_sg" {

}


variable "availability_zones" {
  type = list(string)
  
}
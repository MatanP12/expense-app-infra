
tags = {
  "bootcamp"        = "20",
  "Owner"           = "Matan.Peretz",
  "expiration_date" = "24-04-25"
}

env = "protfolio"

region = "ap-south-1"

availability_zones = ["ap-south-1a", "ap-south-1b"]
cidr_blocks        = ["10.0.1.0/24", "10.0.2.0/24"]


instance_type = "t3a.medium"
min_size      = 1
desired_size  = 3
max_size      = 3

argo_cd_version = "7.0.0"
argo_namespace  = "argo"

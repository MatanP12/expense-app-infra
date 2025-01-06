
tags = {
  "bootcamp"        = "20",
  "Owner"           = "Matan.Peretz",
  "expiration_date" = "24-04-25"
}

env = "protfolio"


region = "ap-south-1"
availability_zones = ["ap-south-1a", "ap-south-1b"]
cidr_block = "10.0.0.0/16"

instance_type = "t3a.medium"
min_size      = 1
desired_size  = 3
max_size      = 3

argo_cd_version = "7.0.0"
argo_namespace  = "argo"

repository_name = "expense-app-gitops"
repository_owner = "MatanP12"
deploy_key_name = "gitops-deploy-key"

secret_name = "gitops-secret"

num_of_subnets = 2
allow_private_subnets = false
tags = {
  "bootcamp"        = "20",
  "Owner"           = "Matan.Peretz",
  "expiration_date" = "24-04-25"
}

region        = "ap-south-1"
instance_type = "t2.micro"
instance_ami  = "ami-007020fd9c84e18c7"

availability_zones = ["ap-south-1a", "ap-south-1b"]
cidr_blocks        = ["10.0.1.0/24", "10.0.2.0/24"]

env = "matan"
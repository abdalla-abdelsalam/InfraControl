cidr_block     = "172.0.0.0/16"
ami_id        = "ami-04e601abe3e1a910f"
instance_type = "t2.micro"
subnets_pub_cidr = ["172.0.1.0/24", "172.0.2.0/24"]
subnets_priv_cidr = ["172.0.3.0/24", "172.0.4.0/24"]
region        = "eu-central-1"
subnets_azs   = ["eu-central-1a", "eu-central-1b"]

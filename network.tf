module "network"{
    source= "./network"
    cidr=var.cidr_block
    subs_pub_cidr=var.subnets_pub_cidr
    azs=var.subnets_azs
    subs_priv_cidr=var.subnets_priv_cidr
}
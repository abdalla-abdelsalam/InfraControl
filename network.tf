module "mynetwork"{
    source= "./network"
    cidr=var.cidr
    sub_pub=var.sub_pub
    azs=var.azs
    sub_priv=var.sub_priv
}
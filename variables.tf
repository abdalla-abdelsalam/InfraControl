variable "cidr_block" {
  type = string
  description = "this is cidr block for vpc"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnets_pub_cidr" {
  type = list(any)
}

variable "subnets_azs" {
  type = list(any)
}

variable "subnets_priv_cidr" {
  type = list(any)
}


variable "region" {
  type = string
}


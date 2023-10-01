variable "cidr" {
  type = string
  description = "this is cidr block for vpc"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "sub_pub" {
  type = list(any)
}

variable "azs" {
  type = list(any)
}

variable "sub_priv" {
  type = list(any)
}


variable "region" {
  type = string
}


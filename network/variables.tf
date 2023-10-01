variable "cidr" {
  type        = string
  description = "this is cidr block for vpc"
}

variable "subs_pub_cidr" {
  type = list(any)
}

variable "azs" {
  type = list(any)
}

variable "subs_priv_cidr" {
  type = list(any)
}

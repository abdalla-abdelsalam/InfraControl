output pub_subnets {
    value = aws_subnet.public_subnets
}

output priv_subnets {
    value = aws_subnet.private_subnets
}

output vpc_id {
    value = aws_vpc.main.id
}

output vpc_cidr {
    value = aws_vpc.main.cidr_block
}

output "sg1" {
    value = aws_security_group.sg1
}
output "sg2" {
    value = aws_security_group.sg2
}
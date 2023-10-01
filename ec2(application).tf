resource "aws_instance" "application_instance" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = module.mynetwork.priv_subnets[0].id

  vpc_security_group_ids = [aws_security_group.sg2.id]

  key_name = aws_key_pair.terraform-key2.id

  tags = {
    Name = "application_instance"
  }

}

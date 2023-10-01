resource "tls_private_key" "rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform-key2" {
  key_name   = "terraform-key2"
  public_key = tls_private_key.rsa-key.public_key_openssh
}

resource "local_file" "tf-key2" {
  content  = tls_private_key.rsa-key.private_key_pem
  filename = "terraform-key2.pem"
}    
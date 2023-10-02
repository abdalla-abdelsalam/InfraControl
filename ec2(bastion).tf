resource "aws_instance" "bastion_instance" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = module.network.pub_subnets[0].id

  vpc_security_group_ids = [module.network.sg1.id]

  key_name = aws_key_pair.terraform-key2.id

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory"
  }

  user_data = <<-EOF
    #!/bin/bash
    echo "${tls_private_key.rsa-key.private_key_pem}" > /home/ubuntu/private_key.pem
    sudo chmod 400 private_key.pem

EOF

  tags = {
    Name = "Bastion_instance"
  }

}
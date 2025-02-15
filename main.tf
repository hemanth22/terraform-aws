terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  key_name               = "bitroid"
  ami                    = "ami-08f2642bb132b988c"
  instance_type          = "c1.medium"
  vpc_security_group_ids = ["sg-098b815eb11f8a49a"]
  subnet_id              = "subnet-0c54dc9c778537899"

  root_block_device {
    volume_size = "10"
    volume_type = "gp2"
    delete_on_termination = "true"
  }

  user_data_base64="IyEvYmluL2Jhc2gKeXVtIGluc3RhbGwgLXkgd2dldAp3Z2V0IC1PIGF6dXJlamVua2lucy5zaCBodHRwczovL2dpdC5pby9iaXRyb2lkamVua2luc2VjMiAmJiBzaCBhenVyZWplbmtpbnMuc2g="

}

output "Public_IP" {
  value = aws_instance.example.public_ip
}

output "Private_IP" {
  value = aws_instance.example.private_ip
}

output "Public_DNS" {
  value = aws_instance.example.public_dns
}

output "Private_DNS" {
  value = aws_instance.example.private_dns
}

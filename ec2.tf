resource "aws_instance" "first_ec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = lookup(var.env_instance_type, terraform.workspace)

  tags = {
    Name = "HelloWorld"
  }

  key_name = "test-key-pair"
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./test-key-pair.pem")
    host        = self.public_ip
    agent       = false
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo ip r >> ~/test-remote.txt" #"sudo service nginx start"
    ]
  }
  /*
  provisioner "local-exec" {
    command = "sudo ip r >> ~/test-local.txt" #"sudo service nginx start"
  }
  */
}

/*
resource "aws_instance" "second_ec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = var.size["${count.index}"]

  count = 1

  tags = {
    Name = "HelloWorld - ${var.env_names[count.index]}"
  }

}
*/

module "ec2module"{
  source = "./modules/dev/ec2"
  #ec2_instance_type = "t2.nano" works but costs.
}

module "aws_ec2" {
  source = "./modules/dev/aws_ec2"
  ec2_security_group_id = [aws_security_group.allow_tls_dinamically.id]
}

/*
output "ec2_arns" {
  value = aws_instance.second_ec2[*].arn
}



output "ec2_names" {
  value = aws_instance.second_ec2[*].tags.Name
}

output "ec2_arn_by_name" {
  value = zipmap(aws_instance.second_ec2[*].tags.Name, aws_instance.second_ec2[*].arn)
}
*/


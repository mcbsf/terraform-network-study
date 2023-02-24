
resource "aws_eip" "mario_eip" {
  vpc = true
}

output "eip" {
  value = aws_eip.mario_eip.public_ip
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.first_ec2.id
  allocation_id = aws_eip.mario_eip.id
}


resource "aws_instance" "ec2module" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = var.ec2_instance_type

  tags = {
    Name = "HelloWorld - Module"
  }

}

variable "ec2_instance_type"{
  default = "t2.micro"
}
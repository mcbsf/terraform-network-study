
module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  ami           = "ami-0b0dcb5067f052a63"

  name = "single-instance-aws"

  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = var.ec2_security_group_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}

  variable "ec2_instance_type"{
    default = "t2.micro"
  }

  variable "ec2_security_group_id"{
    default = null
}
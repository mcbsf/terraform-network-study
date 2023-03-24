provider "aws" {
  region     = "us-east-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
} // NOT GOOD PRATICE, HIDE KEYS IN ~/.aws/credentials with aws cli after remove aws-vault and format

provider "aws" {
  alias = "provider2"
  region     = "us-east-2"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
} // NOT GOOD PRATICE, HIDE KEYS IN ~/.aws/credentials with aws cli after remove aws-vault and format


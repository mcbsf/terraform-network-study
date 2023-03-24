provider "aws" {
  region     = "us-east-1"
} // NOT GOOD PRATICE, HIDE KEYS IN ~/.aws/credentials with aws cli after remove aws-vault and format

provider "aws" {
  alias = "provider2"
  region     = "us-east-2"
} // NOT GOOD PRATICE, HIDE KEYS IN ~/.aws/credentials with aws cli after remove aws-vault and format


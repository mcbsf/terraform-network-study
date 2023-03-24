provider "aws" {
  region     = "us-east-1"
  access_key = file("./sensitive_data/access_key.txt")
  secret_key = file("./sensitive_data/secret_key.txt")
} // NOT GOOD PRATICE, HIDE KEYS IN ~/.aws/credentials with aws cli after remove aws-vault and format

provider "aws" {
  alias = "provider2"
  region     = "us-east-2"
  access_key = file("./sensitive_data/access_key.txt")
  secret_key = file("./sensitive_data/secret_key.txt")
} // NOT GOOD PRATICE, HIDE KEYS IN ~/.aws/credentials with aws cli after remove aws-vault and format


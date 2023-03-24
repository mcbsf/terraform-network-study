/* terraform{
    backend "s3" {
        bucket         = "mario-terraform-s3"
        key            = "network/tmp.tfstate"
        region         = "us-east-1"
        dynamodb_table = "terraform-state-lock-dynamo"
    }
}  */
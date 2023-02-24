
resource "aws_s3_bucket" "mario_s3" {
  bucket = "mario-terraform-s3"
}


output "mys3bucket" {
  value = aws_s3_bucket.mario_s3
}


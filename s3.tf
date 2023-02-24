
resource "aws_s3_bucket" "mario_s3" {
  bucket = "mario-terraform-s3"
  force_destroy = true
}


output "mys3bucket" {
  value = aws_s3_bucket.mario_s3
}


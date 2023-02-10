
resource "aws_s3_bucket" "first_s3" {
  bucket = "mario-first-bucket"
}

output "mys3bucket" {
  value = aws_s3_bucket.first_s3
}


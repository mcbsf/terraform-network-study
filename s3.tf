
resource "aws_s3_bucket" "security_s3" {
  bucket = "security"
}

resource "aws_s3_bucket" "network_s3" {
  bucket = "network"
}

output "mys3bucket" {
  value = aws_s3_bucket.security_s3
}


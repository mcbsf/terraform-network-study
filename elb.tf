

data "aws_elb_service_account" "main" {}

resource "aws_s3_bucket_policy" "allow_elb_logging" {
  bucket = aws_s3_bucket.security_s3.id
  policy = <<POLICY
{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::mario-first-bucket/AWSLogs/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.main.arn}"
        ]
      }
    }
  ]
}
POLICY
}


# Create a new load balancer
resource "aws_elb" "first_load_balancer" {
  name               = "first-terraform-elb"
  availability_zones = var.available_tzs
#commenting to destroy easily becouse this create a file in bucket and terraform cant destroy resource with items within
/*
  access_logs {
    bucket   = aws_s3_bucket.first_s3.bucket
    interval = 60
  }
*/
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }



  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}
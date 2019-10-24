resource "aws_iam_policy" "s3-logs-policy" {
  name        = "${upper(var.environment)}-${upper(var.patching_name)}-S3-LOGS-POLICY"
  description = "Patching output for S3 bucket "

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
              "s3:PutObject",
              "s3:GetObject"
          ],
          "Resource": "arn:aws:s3:::${var.ssm_patching_logs_bucket}/*"
      }
  ]
}
EOF
}
resource "aws_iam_policy" "S3reportBucketFullAccess" {
  name        = "${module.naming.aws_iam_policy}-AutomationReport"
  path        = "/"
  description = "Allow full access to the production automation report s3 bucket"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Put*",
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": [
        "${var.report_bucket_arn}",
        "${var.report_bucket_arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "EC2S3reportBucketFullAccess" {
  name   = "${module.naming.aws_iam_policy}-EC2AutomationReport"
  role   = "${aws_iam_role.default.id}"
  policy = "${aws_iam_policy.S3reportBucketFullAccess.policy}"
}

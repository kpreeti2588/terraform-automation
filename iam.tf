#
# This is required so the application can authenticate on the EC2 instance without using aws credentials
#
resource "aws_iam_role" "default" {
  name = "${module.naming.aws_iam_role}-default"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

#
# This is required so the EC2 instance able to pull docker image from ECR docker registry
#
resource "aws_iam_role_policy" "AmazonEC2ContainerRegistryReadOnly" {
  name   = "${module.naming.aws_iam_policy}-AmazonEC2ContainerRegistryReadOnly"
  role   = "${aws_iam_role.default.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetRepositoryPolicy",
        "ecr:DescribeRepositories",
        "ecr:ListImages",
        "ecr:BatchGetImage"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "instance_policy" {
    name = "${module.naming.aws_iam_policy}-automation-lifecycle_management_policy"
    role   = "${aws_iam_role.default.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:StartInstances",
        "ec2:StopInstances",
        "ec2:RebootInstances",
        "ec2:TerminateInstances",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetRepositoryPolicy",
        "ecr:DescribeRepositories",
        "ecr:ListImages",
        "ecr:BatchGetImage"
       ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#
# This is required so EC2 instance has an instance profile attached
#
resource "aws_iam_instance_profile" "default" {
  name = "${module.naming.aws_iam_instance_profile}"

  roles = [
    "${aws_iam_role.default.id}",
  ]
}

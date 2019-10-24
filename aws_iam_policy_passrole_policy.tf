resource "aws_iam_policy" "passrole-policy" {
  name        = "${upper(var.environment)}-${upper(var.patching_name)}-PASSROLE-POLICY"
  description = "A PassRole policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PassRolePolicy",
          "Effect": "Allow",
          "Action": "iam:PassRole",
          "Resource": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/system/${aws_iam_role.patching_role.name}"
      }
  ]
}
EOF
}
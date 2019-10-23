resource "aws_iam_policy_attachment" "patching_policy" {
  name       = "patching-policy-attachment"
  roles      = [aws_iam_role.patching_role.name]
  policy_arn = aws_iam_policy.patching_policy.arn
}

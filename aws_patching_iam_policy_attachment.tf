resource "aws_iam_role_policy_attachment" "patching_policy" {
  role      = aws_iam_role.patching_role.name
  policy_arn = aws_iam_policy.patching_policy.arn
}

resource "aws_iam_role_policy_attachment" "passrole_access" {
  role      = aws_iam_role.patching_role.name
  policy_arn = aws_iam_policy.passrole-policy.arn
}
resource "aws_iam_role_policy_attachment" "s3_log_access" {
  role      = aws_iam_role.patching_role.name
  policy_arn = aws_iam_policy.s3-logs-policy.arn
}

resource "aws_iam_role_policy_attachment" "patching-access" {
  role       = aws_iam_role.patching_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSSMAutomationRole"
}
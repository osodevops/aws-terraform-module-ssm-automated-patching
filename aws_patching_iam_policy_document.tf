data "aws_iam_policy_document" "patching_config_trust" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "this_patch" {
  statement {
    sid       = "ListCommands"
    effect    = "Allow"
    actions   = ["ssm:ListCommands"]
    resources = ["*"]
  }

  statement {
    sid       = "RunPatchBaseline"
    effect    = "Allow"
    actions   = ["ssm:SendCommand"]
    resources = ["arn:aws:ssm:*:*:document/*"]
  }

  statement {
    sid       = "ApplyOnInstances"
    effect    = "Allow"
    actions   = ["ssm:SendCommand"]
    resources = ["arn:aws:ec2:*:*:instance/*"]
  }
}
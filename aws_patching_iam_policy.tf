resource "aws_iam_policy" "patching_policy" {
  name        = "${upper(var.environment)}-${upper(var.patching_name)}-PATCHING-POLICY"
  path        = "/"
  description = "Allow SSM to automatically scan and apply secuirty patches to ${var.patching_name}"

  policy = data.aws_iam_policy_document.this_patch.json
}

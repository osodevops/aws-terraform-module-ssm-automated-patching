resource "aws_iam_role" "patching_role" {
  name               = "${upper(var.environment)}-${upper(var.patching_name)}-PATCHING-ROLE"
  description        = "Allows SSM to patch running instances."
  assume_role_policy = data.aws_iam_policy_document.patching_config_trust.json
}

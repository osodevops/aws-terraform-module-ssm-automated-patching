
resource "aws_ssm_patch_baseline" "patch_security_baseline" {
  name                              = "patching-security-baseline-${var.patching_name}"
  description                       = "Patch baseline for ${var.application_tag_name}"
  operating_system                  = var.operating_system_filter
  approved_patches_compliance_level = "CRITICAL"

  approval_rule {
    approve_after_days  = 0
    compliance_level    = "CRITICAL"
    enable_non_security = false

    patch_filter {
      key    = "CLASSIFICATION"
      values = ["Security"]
    }
  }
}
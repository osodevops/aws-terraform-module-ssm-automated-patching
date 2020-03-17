resource "aws_ssm_patch_baseline" "patch_security_baseline" {
  name             = "patching-security-baseline-${var.patching_name}"
  description      = "Patch baseline for ${var.application_tag_name}"
  operating_system = var.operating_system_filter

  approval_rule {
    approve_after_days = 0
    compliance_level   = "CRITICAL"
    patch_filter {
      key    = "SEVERITY"
      values = ["Critical"]
    }
  }
  approval_rule {
    approve_after_days = 7
    compliance_level   = "HIGH"
    patch_filter {
      key    = "SEVERITY"
      values = ["Low", "Important", "Moderate"]
    }
  }
}


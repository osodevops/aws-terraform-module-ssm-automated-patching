resource "aws_ssm_maintenance_window" "patching_window" {
  name              = "patching-window-${var.patching_name}"
  enabled           = var.patching_enabled
  schedule_timezone = var.schedule_timezone
  schedule          = var.patching_window
  duration          = var.patching_duration
  cutoff            = var.patching_cutoff
}


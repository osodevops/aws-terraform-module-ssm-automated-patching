resource "aws_ssm_maintenance_window" "patching_window" {
  name              = "patching-window-${var.patching_name}"
  enabled           = true
  schedule_timezone = var.schedule_timezone
  schedule          = "cron(0 0 7 ? * SUN *)"
  duration          = 5
  cutoff            = 0
}
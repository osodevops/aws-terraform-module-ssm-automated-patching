resource "aws_ssm_maintenance_window" "patching_window" {
  name              = "patching-window-${var.patching_name}"
  enabled           = true
  schedule_timezone = var.schedule_timezone
//  schedule          = "cron(* 21 * * ? *)"
  schedule          = "cron(0/30 * * * ? *)"
  duration          = 1
  cutoff            = 0
}
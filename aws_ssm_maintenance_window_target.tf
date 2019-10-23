resource "aws_ssm_maintenance_window_target" "patching_window_target" {
  window_id     = aws_ssm_maintenance_window.patching_window.id
  resource_type = "INSTANCE"

  targets {
    key    = "tag:Application"
    values = [var.application_tag_name]
  }
}
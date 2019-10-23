resource "aws_ssm_maintenance_window_task" "patch" {
  window_id        = aws_ssm_maintenance_window.patching_window.id
  name             = "patching-task-${var.patching_name}"
  description      = "Apply patch management"
  task_type        = "RUN_COMMAND"
  task_arn         = "AWS-RunPatchBaseline"
  priority         = 1
  service_role_arn = aws_iam_role.patching_role.arn
  max_concurrency  = "10"
  max_errors       = "1"

  targets {
    key    = "WindowTargetIds"
    values = aws_ssm_maintenance_window_target.patching_window_target.*.id
  }

  task_invocation_parameters {
    run_command_parameters {
      timeout_seconds  = 600
      service_role_arn = aws_iam_role.patching_role.arn
      parameter {
        name = "Operation"
        values = ["Scan"]
      }
    }
  }
}
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
      output_s3_bucket = var.ssm_patching_logs_bucket
      output_s3_key_prefix = "${var.patching_name}/"
      timeout_seconds  = 600
      service_role_arn = aws_iam_role.patching_role.arn
      # Install will perform a scan followed by an install on any missing packages. This is completed with a system
      # rebot. NOTE: Scan only can be used to output results to S3 log bucket and does not cause a rebot.
      parameter {
        name = "Operation"
        values = ["Install"]
      }
    }
  }
}
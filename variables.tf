variable "application_tag_name" {
  type        = string
  description = "Must exactly matchh the application tag present in OSO DevOps common tags list"
}

variable "environment" {
  type        = string
  description = "Prefix for all IAM roles, policies and resources created to patching module."
}

variable "operating_system_filter" {
  default     = "CENTOS"
  type        = string
  description = "Possible values: AMAZON_LINUX AMAZON_LINUX_2 UBUNTU CENTOS REDHAT_ENTERPRISE_LINUX"
}

variable "patching_name" {
  type        = string
  description = "System name given to patching task: MUST NOT CONTAIN SPACES."
}

variable "patching_window" {
  type        = string
  default     = "cron(0 0 7 ? * SUN *)"
}

variable "patching_duration" {
  type        = number
  default     = 5
}

variable "patching_cutoff" {
  type        = number
  default     = 0
}

variable "patching_enabled" {
  type        = bool
  default     = true
}

variable "schedule_timezone" {
  default     = "Europe/London"
  type        = string
  description = "TimeZone on whihch the patching schedule should be run."
}

variable "ssm_patching_logs_bucket" {
  type        = string
  description = "Bucket name of outputted log information from each automation task run."
}



variable "common_tags" {
  type = map(string)
}


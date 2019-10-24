variable "application_tag_name" {
  type = "string"
}
variable "environment" {
}

variable "ssm_patching_logs_bucket" {
  type = "string"
}

variable "rejected_patches" {
  type        = "list"
  description = "A list with rejected patches to not apply due to incompatibility with the environment"
  default     = []
}
variable "patching_name" {}

variable "operating_system_filter" {
  default = "CENTOS"
}

variable "schedule_timezone" {
  default = "Europe/London"
  type = "string"
}

variable "common_tags" {
  type = "map"
}

locals {

}
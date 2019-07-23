variable "product_name" {}

variable "product_code_tag" {}
variable "inventory_code_tag" {}
variable "account_tag" {}
variable "environment_tag" {}
variable "vpc" {}
variable "zone" {
  default = "nonprod-tmaws.io"
}
variable "tier" {}
variable "availability_zone" {}

variable "instance_type" {}
variable "ssh_key" {}

variable "environment_name" {
  default = "GENERIC"
}

variable "enable_monitoring" {
  default = "false"
}
variable "ebs_optimized" {
  default = "false"
}

##### Starndard trending/monitoring stuffs
variable "cadvisor_url" {
  default = "https://github.com/google/cadvisor/releases/download/v0.22.0/cadvisor"
}

variable "cadvisor_port" {
  default = 4914
}

variable "bucket_access" {
  default = "private"
}

variable automation_instances {}

# simulation repo branch
variable "automation_scenario_branch" {
  default = "galen"
}

# simulation repo commit hash
variable "git_commit" {
  default = ""
}

## Terraform will run for 50 minutes before killing the job. Can be increased.
variable "max_runtime" {
  default = "36000"
}

# Debug automation config is available
variable "config" {
  default = "cloud-config.yaml"
}

variable "docker_image_version" {
  default = "1.0"
}

## Repo of Automation Simulations and Configuration
variable "automation_scenario_repo" {
  default = "https://git.tmaws.io/nam/nam-automation.git"
}

# Variables for Reports bucket. Do not change.
variable "s3_report_bucket" {
  default = "prd00000121.gatling.prod1.us-east-1.tmaws-report"
}
variable "report_bucket_arn" {
  default = "arn:aws:s3:::prd00000121.gatling.prod1.us-east-1.tmaws-report"
}

variable "awscli_version" {
  default = "1.10.64"
}

variable "run_description" {
  default = "Automation Scenarios"
}

variable "jenkins_port" {
  default = "8080"
}

variable "modified_by" {
  default = "NA"
}
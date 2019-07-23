variable "product_name" {}

variable "product_code_tag" {}
variable "inventory_code_tag" {}
variable "account_tag" {}
variable "environment_tag" {}
variable "vpc" {}
variable "tier" {}
variable "availability_zone" {}

variable "instance_type" {}
variable "ssh_key" {}

variable "calendar_name" {}
variable "environment_name" {}

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

variable "client_name" {}

## Terraform will run for 50 minutes before killing the job. Can be increased.
variable "max_runtime" {
  default = "36000"
}

# Debug automation config is available
variable "config" {
  default = "cloud-config.yaml"
}

variable "docker_image_version" {
  default = "base"
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

variable "env_config" {}
variable "related_env" {}
variable "device_conf" {}
variable "run_locally" {
  default = "true"
}
variable "groups" {}
variable "create_account" {
  default = "addEventsOnlyForNewAccounts"
}
variable "use_ats_generic_url" {
  default = "true"
}
variable "admin_username" {
  default = ""
}
variable "admin_password" {
  default = ""
}
variable "sessions" {
  default = ""
}
variable "set_session" {
  default = "true"
}
variable "selenium_uri" {
  default = ""
}
variable "parallel" {
  default = ""
}
variable "seats_paid" {
  default = ""
}
variable "generate_new_testng_file" {
  default = "false"
}
variable "suite_to" {
  default = "prateek.ladha@ticketmaster.com;tejpal@ticketmaster.com;sanghamitra.das@ticketmaster.com;navjyot.singh@ticketmaster.com;akshat.mishra@ticketmaster.com;bhawna.sharma@ticketmaster.com;preeti.kumari@ticketmaster.com;ashish.tanwar@ticketmaster.com"
}
variable "class_to" {
  default = "prateek.ladha@ticketmaster.com;tejpal@ticketmaster.com;sanghamitra.das@ticketmaster.com;navjyot.singh@ticketmaster.com;akshat.mishra@ticketmaster.com;bhawna.sharma@ticketmaster.com;preeti.kumari@ticketmaster.com;ashish.tanwar@ticketmaster.com"
}
variable "take_screenshot" {
  default = "false"
}
variable "screen_size_padding" {
  default = ""
}
variable "jenkins_ip" {
  default = ""
}
variable "account_status" {
  default = "PLAN"
}
variable "device_list" {
  default = "laptop,desktop,mobile"
}
variable "attach_log_file" {
  default = "false"
}
variable "splunk_log_integration" {
  default = "true"
}
variable "video_gif_integration" {
  default = "true"
}
variable "console_log_integration" {
  default = "true"
}
variable "generate_gif_only_on_failure" {
  default = "true"
}
variable "kibana_log_integration" {
  default = "true"
}
variable "execute_post_build_action" {
  default = "true"
}
variable "gatling_host" {
  default = "http://gatling-reports.tmaws.io/"
}
variable "sauce_port" {
  default = "4446"
}
variable "connect_to_sauce" {
  default = "false"
}
variable "sauce_tunnel_id" {
  default = ""
}
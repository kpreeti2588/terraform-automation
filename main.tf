#
# Passing Terraform variables onto the cloud-config.yaml file
#
data "template_file" "userdata" {
  template = "${file("${path.module}/${var.config}")}"

  vars {
    class              = "${var.inventory_code_tag}"
    environment_tag    = "${var.environment_tag}"
    inventory_code_tag = "${var.inventory_code_tag}"
    region             = "${var.aws_region}"
    cadvisor_url       = "${var.cadvisor_url}"
    cadvisor_port      = "${var.cadvisor_port}"
    automation_scenario_repo = "${var.automation_scenario_repo}"
    automation_scenario_branch = "${var.automation_scenario_branch}"
    automation_scenario_git_commit = "${var.git_commit}"
    calendar_name    = "${var.calendar_name}"
    environment_name    = "${var.environment_name}"
    report_bucket      = "${var.s3_report_bucket}"
    max_runtime        = "${var.max_runtime}"
    docker_image_version    = "${var.docker_image_version}"
    run_description    = "Instance Type - ${var.instance_type}: Calendar Name - ${var.calendar_name}: Environment Name - ${var.environment_name}: Docker Version ${var.docker_image_version} - ${var.run_description}"
    awscli_version     = "${var.awscli_version}"
    env_config         = "${var.env_config}"
    related_env        = "${var.related_env}"
    device_conf        = "${var.device_conf}"
    run_locally        = "${var.run_locally}"
    groups             = "${var.groups}"
    create_account     = "${var.create_account}"
    use_ats_generic_url = "${var.use_ats_generic_url}"
    admin_username     = "${var.admin_username}"
    admin_password     = "${var.admin_password}"
    sessions           = "${var.sessions}"
    set_session        = "${var.set_session}"
    selenium_uri       = "${var.selenium_uri}"
    parallel           = "${var.parallel}"
    seats_paid         = "${var.seats_paid}"
    generate_new_testng_file = "${var.generate_new_testng_file}"
    suite_to           = "${var.suite_to}"
    class_to           = "${var.class_to}"
    take_screenshot    = "${var.take_screenshot}"
    screen_size_padding = "${var.screen_size_padding}"
    jenkins_ip         = "${var.jenkins_ip}"
    account_status     = "${var.account_status}"
    device_list        = "${var.device_list}"
    attach_log_file    = "${var.attach_log_file}"
    splunk_log_integration = "${var.splunk_log_integration}"
    video_gif_integration  = "${var.video_gif_integration}"
    console_log_integration = "${var.console_log_integration}"
    generate_gif_only_on_failure = "${var.generate_gif_only_on_failure}"
    kibana_log_integration = "${var.kibana_log_integration}"
    execute_post_build_action = "${var.execute_post_build_action}"
    client_name        = "${var.client_name}"
    gatling_host       = "${var.gatling_host}"
    report_date        = "${timestamp()}"
  }
}

resource "aws_instance" "automation" {
    ami = "${module.ami.ami_id}"
    instance_type = "${var.instance_type}"
    iam_instance_profile = "${aws_iam_instance_profile.default.name}"
    security_groups = ["${module.networks.security_groups[format("%s.%s.%s", var.aws_region, var.vpc, var.tier)]}", "${module.networks.security_groups[format("%s.%s.%s", var.aws_region, var.vpc, "onprem")]}"]
    subnet_id  = "${element(split(",", module.networks.subnet_azs[format("%s.%s.%s", var.availability_zone, var.vpc, var.tier)]), count.index)}"
    key_name = "${var.ssh_key}"
    user_data = "${data.template_file.userdata.rendered}"
    tags {
        Name = "${module.naming.value}"
        ProductCode = "${var.product_code_tag}"
        Environment = "${var.environment_tag}"
        InventoryCode = "${var.inventory_code_tag}"
    }
    count = "${var.automation_instances}"
}

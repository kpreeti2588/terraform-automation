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
    environment_name    = "${var.environment_name}"
    report_bucket      = "${var.s3_report_bucket}"
    max_runtime        = "${var.max_runtime}"
    docker_image_version    = "${var.docker_image_version}"
    run_description    = "Instance Type - ${var.instance_type}: Environment Name - ${var.environment_name}: Docker Version ${var.docker_image_version} - ${var.run_description}"
    awscli_version     = "${var.awscli_version}"
    jenkins_port       = "${var.jenkins_port}"
    FQDN               = "${var.FQDN}"
    report_date        = "${timestamp()}"
  }
}

resource "aws_instance" "automation" {
    ami = "${module.ami.ami_id}"
    instance_type = "${var.instance_type}"
    iam_instance_profile = "${aws_iam_instance_profile.default.name}"
    security_groups = ["${aws_security_group.jenkins.id}", "${module.networks.security_groups[format("%s.%s.%s", var.aws_region, var.vpc, var.tier)]}", "${module.networks.security_groups[format("%s.%s.%s", var.aws_region, var.vpc, "onprem")]}"]
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
    root_block_device {
        volume_size = 50
        volume_type = "standard"
        delete_on_termination = true
    }
}
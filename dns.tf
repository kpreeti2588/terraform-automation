resource "aws_route53_record" "jenkins_ip" {
  zone_id                   = "${module.zones.zone_id}"
  name                      = "${lower(format("%s-nam-%s-%s.%s", var.product_code_tag, var.environment_tag, var.aws_region, var.zone))}"
  type                      = "A"
  ttl                       = 60
  records = ["${aws_instance.automation.private_ip}"]

  lifecycle {
    create_before_destroy   = true
  }
}
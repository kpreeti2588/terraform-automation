output "follow" {
  value = "curl -s http://${aws_instance.automation.private_ip}:19531/entries?follow"
}

output "jenkins-server" {
  value = "${aws_route53_record.jenkins_ip.fqdn}:${var.jenkins_port}"
}
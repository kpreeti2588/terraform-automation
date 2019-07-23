output "follow" {
  value = "curl -s http://${aws_instance.automation.private_ip}:19531/entries?follow"
}

output "report-server" {
  value = "http://gatling-reports.tmaws.io?simulation=${var.calendar_name}&env=${var.client_name}"
}
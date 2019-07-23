resource "aws_security_group" "jenkins" {
  name          = "${var.product_code_tag}-${var.environment_tag}-${var.product_name}"
  vpc_id        = "${module.networks.vpcs[format("%s.%s", var.aws_region, var.vpc)]}"

# temporary open during migration. After account manager completed moved to AWS, this sg should be detached from RDS
# Only need it for Production migration . If you need to setup replication between OnPrem MySQL to Aurora, you may need create this security group
  ingress {
    from_port   = "${var.jenkins_port}"
    to_port     = "${var.jenkins_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
  }

  tags {
    ProductCode   = "${var.product_code_tag}"
    Environment   = "${var.environment_tag}"
    InventoryCode = "${var.inventory_code_tag}"
    Modifier      = "${var.modified_by}"
  }
}
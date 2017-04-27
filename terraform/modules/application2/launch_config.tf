resource "aws_launch_configuration" "application_instance" {
  image_id = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_groups = ["${aws_security_group.application_instance.id}"]
  key_name = "${var.key_name}"
  associate_public_ip_address = false
  ebs_optimized = false
}
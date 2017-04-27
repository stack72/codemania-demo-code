resource "aws_instance" "green_application_instances" {
  count = "${var.green_instance_count}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${element(var.private_subnets, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.application_instance.id}"]
  key_name = "${var.key_name}"

  lifecycle {
    ignore_changes = ["ami"]
  }

  tags {
    Name = "Application Instance - Green Cluster"
  }
}

resource "aws_instance" "blue_application_instances" {
  count = "${var.blue_instance_count}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${element(var.private_subnets, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.application_instance.id}"]
  key_name = "${var.key_name}"

  lifecycle {
    ignore_changes = ["ami"]
  }

  tags {
    Name = "Application Instance - Blue Cluster"
  }
}
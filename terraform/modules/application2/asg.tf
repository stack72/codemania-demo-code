resource "aws_autoscaling_group" "application" {
  vpc_zone_identifier = ["${var.private_subnets}"]
  max_size = "${var.min_cluster_size}"
  min_size = "${var.max_cluster_size}"
  desired_capacity = "${var.desired_capacity}"
  health_check_grace_period = 300
  health_check_type = "ELB"

  launch_configuration = "${aws_launch_configuration.application_instance.name}"
  load_balancers = ["${aws_elb.application_elb.name}"]

  tag {
    key = "Name"
    value = "Application Instance"
    propagate_at_launch = true
  }
}
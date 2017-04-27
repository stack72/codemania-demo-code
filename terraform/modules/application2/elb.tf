resource "aws_elb" "application_elb" {
  name = "application-elb"
  security_groups = ["${aws_security_group.application_elb.id}"]
  subnets = ["${var.public_subnets}"]
  cross_zone_load_balancing = true
  connection_draining = true
  internal = false

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 80
    lb_protocol        = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    target              = "HTTP:80/index.html"
    timeout             = 5
  }

  tags {
    Name = "Application ELB"
  }
}
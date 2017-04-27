resource "aws_security_group" "application_elb" {
  name = "application-elb-sg"
  description = "Security group for the Application ELB"
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "Application ELB"
  }

  # HTTP
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # TCP All outbound traffic
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "application_instance" {
  name = "application-instance-sg"
  description = "Security group for Application instances"
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "Application Instance"
  }

  # SSH
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP UI from ELB
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = ["${aws_security_group.application_elb.id}"]
  }

  # TCP All outbound traffic
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
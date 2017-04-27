provider "aws" {
  region = "eu-west-1"
}

provider "dnsimple" {}

resource "aws_key_pair" "ssh_key" {
  key_name = "belgiumhug"
  public_key = "${file("../ssh/belgiumhug.pub")}"
}

module "vpc" {
  source = "../modules/vpc"

  name = "belgiumhug"

  cidr = "${var.cidr_block}"

  private_subnets = [
    "${cidrsubnet(var.cidr_block, 3, 5)}", //10.1.160.0/19
    "${cidrsubnet(var.cidr_block, 3, 6)}", //10.1.192.0/19
    "${cidrsubnet(var.cidr_block, 3, 7)}"  //10.1.224.0/19
  ]

  public_subnets = [
    "${cidrsubnet(var.cidr_block, 5, 0)}", //10.1.0.0/21
    "${cidrsubnet(var.cidr_block, 5, 1)}", //10.1.8.0/21
    "${cidrsubnet(var.cidr_block, 5, 2)}"  //10.1.16.0/21
  ]

  availability_zones = ["${data.aws_availability_zones.zones.names}"]
}

module "vpn" {
  source = "../modules/vpn"

  vpc_id = "${module.vpc.vpc_id}"
  public_subnets = ["${module.vpc.public_subnets}"]
  ami = "${var.openvpn_ami_id}"
  key_name = "${aws_key_pair.ssh_key.key_name}"
  tag_name = "belgiumhug"
}

module "application_tier" {
  source = "../modules/application2"
  max_cluster_size = "3"
  min_cluster_size = "0"
  desired_capacity = "3"
  ami = "${data.aws_ami.application_instance_ami.id}"
  availability_zones = ["${module.vpc.public_availability_zones}"]
  private_subnets = ["${module.vpc.private_subnets}"]
  public_subnets = ["${module.vpc.public_subnets}"]
  instance_type = "t2.micro"
  vpc_id = "${module.vpc.vpc_id}"
  key_name = "${aws_key_pair.ssh_key.key_name}"
}

data "aws_ami" "application_instance_ami" {
  most_recent = true
  filter {
    name = "name"
    values = ["application_instance-*"]
  }
  filter {
    name = "tag:Version"
    values = ["1.0.0"]
  }
}


data "aws_availability_zones" "zones" {}
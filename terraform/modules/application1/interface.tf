variable "vpc_id" {
  description = "The VPC to Launch the application tier in"
  type = "string"
}
variable "private_subnets" {
  description = "The List of Private Subnet IDs"
  type = "list"
}
variable "public_subnets" {
  description = "The List of Public Subnet IDs"
  type = "list"
}
variable "availability_zones" {
  description = "The List of Availability Zones"
  type = "list"
}
variable "ami" {
  description = "The AMI ID to launch instances from"
  type = "string"
}
variable "instance_type" {
  description = "The Instance Size to Launch"
  type = "string"
}
variable "key_name" {
  description = "Name of the Key Pair to associate with the instance"
  type = "string"
}
variable "green_instance_count" {
  description = "The number of instances to launch in the green cluster"
  type = "string"
  default = "3"
}
variable "blue_instance_count" {
  description = "The number of instances to launch in the blue cluster"
  type = "string"
  default = "0"
}

output "green_application_elb_address" {
  value = "${aws_elb.application_elb_green.dns_name}"
}

output "blue_application_elb_address" {
  value = "${aws_elb.application_elb_blue.dns_name}"
}

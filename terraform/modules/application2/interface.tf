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
  description = "The name of the SSH Key to use with the instance"
  type = "string"
}
variable "min_cluster_size" {
  description = "The minimum number of instances in the cluster"
  default = "0"
  type = "string"
}
variable "max_cluster_size" {
  description = "The maximum number of instances in the cluster"
  type = "string"
}
variable "desired_capacity" {
  description = "The expected number of instances in the cluster"
  type = "string"
}

output "elb_address" {
  value = "${aws_elb.application_elb.dns_name}"
}
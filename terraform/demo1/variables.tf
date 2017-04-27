variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "openvpn_ami_id" {
  default = "ami-f53d7386"
}

variable "domain_name" {
  default = "hashicorptest.com"
}
variable "dns_record_name" {
  default = "codemania"
}

variable "green_instance_count" {}
variable "blue_instance_count" {}
variable "ami_version" {}
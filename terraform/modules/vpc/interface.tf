variable "name" {
    type = "string"
}

variable "cidr" {
    type = "string"
}

variable "public_subnets" {
    type = "list"
}

variable "private_subnets" {
    type = "list"
}

variable "availability_zones" {
    type = "list"
}

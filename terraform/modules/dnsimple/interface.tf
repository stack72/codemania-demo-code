variable "domain_name" {
  description = "Name of the DNS Zone to create a record in"
  type = "string"
}
variable "cname_value" {
  description = "The DNS Address to CNAME to"
  type = "string"
}
variable "record_name" {
  description = "The Record name to CNAME to"
  type = "string"
}
variable "ttl" {
  description = "The TTL for hte DNS record"
  type = "string"
  default = "60"
}
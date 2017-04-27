resource "dnsimple_record" "myapplication" {
  domain = "${var.domain_name}"
  name = "${var.record_name}"
  value = "${var.cname_value}"
  type = "CNAME"
  ttl = "${var.ttl}"
}
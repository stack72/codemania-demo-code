output "vpn_setup_command" {
  value = "${format("ssh openvpnas@%s", module.vpn.vpn_ip)}"
}
output "vpn_web_console" {
  value = "${format("https://%s/", module.vpn.vpn_ip)}"
}

output "elb_address" {
  value = "${module.application_tier.elb_address}"
}
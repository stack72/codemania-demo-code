output "vpn_setup_command" {
  value = "${format("ssh openvpnas@%s", module.vpn.vpn_ip)}"
}
output "vpn_web_console" {
  value = "${format("https://%s/", module.vpn.vpn_ip)}"
}

output "green_elb_address" {
  value = "${module.application_tier.green_application_elb_address}"
}

output "blue_elb_address" {
  value = "${module.application_tier.blue_application_elb_address}"
}
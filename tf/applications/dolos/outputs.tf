output "do_droplet_ip" {
  value = module.digitalocean.do_droplet_ip
}

output "ovh_instance_ip" {
  description = "Public IPv4 address of the OVHCloud instance"
  value       = module.ovhcloud.ovh_instance_ip
}

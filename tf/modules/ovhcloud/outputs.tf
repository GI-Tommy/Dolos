output "ovh_instance_ip" {
  description = "Public IPv4 address of the OVHCloud instance"
  value       = openstack_compute_instance_v2.dolos.access_ip_v4
}

output "ovh_ssh_private_key" {
  description = "SSH private key for DigitalOcean"
  sensitive   = true
  value       = tls_private_key.ovh_ssh_key.private_key_openssh
}

output "ovh_ssh_public_key" {
  description = "SSH public key for DigitalOcean"
  value       = tls_private_key.ovh_ssh_key.public_key_openssh
}

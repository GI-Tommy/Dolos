output "do_droplet_ip" {
  description = "Public IPv4 address of the DigitalOcean Droplet"
  value       = digitalocean_droplet.dolos.ipv4_address
}

output "do_ssh_private_key" {
  description = "SSH private key for DigitalOcean"
  sensitive   = true
  value       = tls_private_key.do_ssh_key.private_key_openssh
}

output "do_ssh_public_key" {
  description = "SSH public key for DigitalOcean"
  value       = tls_private_key.do_ssh_key.public_key_openssh
}

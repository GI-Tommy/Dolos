# Create a new SSH key
resource "tls_private_key" "do_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# # Copy generated SSH private key to a file on local disk
# resource "local_sensitive_file" "do_private_key" {
#   filename             = pathexpand("../files/output/ssh/digitalocean/id_rsa")
#   file_permission      = "600"
#   directory_permission = "700"
#   content              = tls_private_key.do_ssh_key.private_key_openssh
# }

# # Copy generated SSH public key to a file on local disk
# resource "local_file" "do_public_key" {
#   filename = pathexpand("../files/output/ssh/digitalocean/id_rsa.pub")
#   content  = tls_private_key.do_ssh_key.public_key_openssh
# }

# Add the generated SSH key to Digital Ocean
resource "digitalocean_ssh_key" "dolos" {
  name       = "OpenTofu dolos key"
  public_key = tls_private_key.do_ssh_key.public_key_openssh
}

# Create a new Droplet
resource "digitalocean_droplet" "dolos" {
  image    = var.do_image
  name     = var.do_droplet_name
  region   = var.do_region
  size     = var.do_size
  ssh_keys = [digitalocean_ssh_key.dolos.fingerprint]
}

# Create a firewall rule
resource "digitalocean_firewall" "dolos" {
  name = "only-22-and-8080"

  droplet_ids = [digitalocean_droplet.dolos.id]

  inbound_rule {
    protocol   = "tcp"
    port_range = "22"
    # source_addresses = ["0.0.0.0/0", "::/0"]
    source_addresses = [jsondecode(data.http.myip_json.response_body).ip]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8080"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

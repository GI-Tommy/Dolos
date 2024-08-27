# Create a new SSH key
resource "tls_private_key" "ovh_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# # Copy generated SSH private key to a file on local disk
# resource "local_sensitive_file" "ovh_private_key" {
#   filename             = pathexpand("../files/output/ssh/ovhcloud/id_rsa")
#   file_permission      = "600"
#   directory_permission = "700"
#   content              = tls_private_key.ovh_ssh_key.private_key_openssh
# }

# # Copy generated SSH public key to a file on local disk
# resource "local_file" "ovh_public_key" {
#   filename = pathexpand("../files/output/ssh/ovhcloud/id_rsa.pub")
#   content  = tls_private_key.ovh_ssh_key.public_key_openssh
# }

resource "openstack_networking_secgroup_v2" "secgroup_1" {
  name        = "secgroup_1"
  description = "Allow 22 and 8080 only"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_10" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "${jsondecode(data.http.myip_json.response_body).ip}/32"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_20" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8080
  port_range_max    = 8080
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_30" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  port_range_min    = 0
  port_range_max    = 0
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_40" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 53
  port_range_max    = 53
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

resource "openstack_compute_keypair_v2" "ovh_keypair" {
  name       = var.os_keypair_name
  public_key = tls_private_key.ovh_ssh_key.public_key_openssh
}

resource "openstack_compute_instance_v2" "dolos" {
  name            = var.os_instance_name
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_name     = var.os_flavor_name
  key_pair        = var.os_keypair_name
  security_groups = ["secgroup_1"]
  # security_groups = ["default"]

  depends_on = [
    openstack_networking_secgroup_v2.secgroup_1,
    openstack_compute_keypair_v2.ovh_keypair
  ]

  # metadata = {
  #   this = "that"
  # }

  network {
    name = "Ext-Net"
  }
}

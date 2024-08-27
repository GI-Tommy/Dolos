locals {
  ssh_output_dir = "./files/output/ssh"
}

module "digitalocean" {
  source = "../../modules/digitalocean"

  do_token        = var.do_token
  do_droplet_name = "dolas-1"

  # Variables below are defaulted in the module, the default values are provided
  # here for your convience

  #   do_region = "lon1"
  #   do_image  = "ubuntu-22-04-x64"
  #   do_size   = "s-1vcpu-1gb"
}

# Copy generated DigitalOcean SSH keypairs to a file on local disk
resource "local_sensitive_file" "do_private_key" {
  filename             = pathexpand("${local.ssh_output_dir}/digitalocean/id_rsa")
  file_permission      = "600"
  directory_permission = "700"
  content              = module.digitalocean.do_ssh_private_key
}
resource "local_file" "do_public_key" {
  filename        = pathexpand("${local.ssh_output_dir}/digitalocean/id_rsa.pub")
  content         = module.digitalocean.do_ssh_public_key
  file_permission = "664"
}

module "ovhcloud" {
  source = "../../modules/ovhcloud"

  os_user_name     = var.os_user_name
  os_password      = var.os_password
  os_tenant_id     = var.os_tenant_id
  os_instance_name = "dolas-1"

  # Variables below are defaulted in the module, the default values are provided
  # here for your convience

  # os_auth_url = "https://auth.cloud.ovh.net/v3"
  # os_region = "UK1"
  # os_flavor_name = "d2-2" # 1vCPU, 2GB RAM
  # os_image_name = "Ubuntu 22.04"
  # os_keypair_name = "ovh_keypair"
}

# Copy generated OVHCloud SSH keypairs to a file on local disk
resource "local_sensitive_file" "ovh_private_key" {
  filename             = pathexpand("${local.ssh_output_dir}/ovhcloud/id_rsa")
  file_permission      = "600"
  directory_permission = "700"
  content              = module.ovhcloud.ovh_ssh_private_key
}
resource "local_file" "ovh_public_key" {
  filename = pathexpand("${local.ssh_output_dir}/ovhcloud/id_rsa.pub")
  content  = module.ovhcloud.ovh_ssh_public_key
}

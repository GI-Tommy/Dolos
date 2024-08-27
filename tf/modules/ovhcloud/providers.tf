terraform {
  required_providers {
    # ovh = {
    #   source = "ovh/ovh"
    # }

    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 2.1.0"
    }
  }
}

# provider "ovh" {
#   # Generate these keys here: 
#   # https://api.ovh.com/createToken/?GET=/*&POST=/*&PUT=/*&DELETE=/*
#   endpoint           = var.ovh_endpoint
#   application_key    = var.ovh_application_key
#   application_secret = var.ovh_application_secret
#   consumer_key       = var.ovh_consumer_key
# }

# Configure the OpenStack Provider
provider "openstack" {
  user_name = var.os_user_name
  password  = var.os_password
  tenant_id = var.os_tenant_id
  auth_url  = var.os_auth_url
  region    = var.os_region
}

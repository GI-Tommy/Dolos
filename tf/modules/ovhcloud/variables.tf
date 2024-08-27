# OVHCloud variables
# -----------------------------------------------------------------------------

# variable "ovh_endpoint" {
#   description = "value"
#   type        = string
#   default     = "ovh-eu"
# }

# variable "ovh_application_key" {
#   description = "value"
#   type        = string
#   sensitive   = true
# }

# variable "ovh_application_secret" {
#   description = "value"
#   type        = string
#   sensitive   = true
# }

# variable "ovh_consumer_key" {
#   description = "value"
#   type        = string
#   sensitive   = true
# }

# OVHCloud variables (OpenStack)
# -----------------------------------------------------------------------------

variable "os_user_name" {
  description = "value"
  type        = string
  sensitive   = true
}

variable "os_password" {
  description = "value"
  type        = string
  sensitive   = true
}

variable "os_tenant_id" {
  description = "value"
  type        = string
  sensitive   = true
}

variable "os_auth_url" {
  description = "value"
  type        = string
  default     = "https://auth.cloud.ovh.net/v3"
}

variable "os_region" {
  description = "value"
  type        = string
  default     = "UK1"
}

variable "os_flavor_name" {
  description = "The flavor name (instance type)"
  type        = string
  default     = "d2-2" # 1vCPU, 2GB RAM
}

variable "os_image_name" {
  description = "The image name to search for in the data source"
  type        = string
  default     = "Ubuntu 22.04"
}

variable "os_instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "os_keypair_name" {
  description = "Name of the SSH keypair"
  type        = string
  default     = "ovh_keypair"
}

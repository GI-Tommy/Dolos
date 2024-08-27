variable "do_token" {
  description = "The API token for Digital Ocean"
  type        = string
  sensitive   = true
}

variable "do_region" {
  description = "Region to use within Digital Ocean"
  type        = string
  default     = "lon1"
}

variable "do_image" {
  description = "Droplet image to use"
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "do_size" {
  description = "Droplet size"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "do_droplet_name" {
  description = "Name of the droplet"
  type        = string
}

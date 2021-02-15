
variable "name" {
  type        = string
  description = "Name"

}

variable "ip_address_type" {
  type        = string
  description = "ip address type"

}

variable "dns_name_label" {
  type        = string
  description = "dns label name"

}

variable "os_type" {
  type        = string
  description = "os type"

}

variable "container_name" {
  type        = string
  description = "container name"

}
variable "container_image" {
  type        = string
  description = "image"

}
variable "container_cpu" {
  type        = string
  description = "cpu"

}
variable "container_memory" {
  type        = string
  description = "memory"

}
variable "container_port" {
  type        = number
  description = "port"

}
variable "container_protocol" {
  type        = string
  description = "protocol"

}
variable "tags_env" {
  type        = string
  description = "environment"

}

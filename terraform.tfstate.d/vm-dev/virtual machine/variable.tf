
variable "name" {
  type        = string
  description = "protocol"

}
variable "vm_size" {
  type        = string
  description = "protocol"

}
variable "image_publisher" {
  type        = string
  description = "protocol"

}
variable "image_offer" {
  type        = string
  description = "protocol"

}
variable "image_sku" {
  type        = string
  description = "protocol"

}
variable "image_version" {
  type        = string
  description = "protocol"

}
variable "image_os_name" {
  type        = string
  description = "protocol"

}
variable "image_os_caching" {
  type        = string
  description = "protocol"

}
variable "image_os_create" {
  type        = string
  description = "protocol"

}
variable "image_os_managed" {
  type        = string
  description = "protocol"

}
variable "image_profile_computer" {
  type        = string
  description = "protocol"

}
variable "image_profile_username" {
  type        = string
  description = "protocol"

}
variable "image_profile_password" {
  type        = string
  description = "protocol"

}
variable "image_linux_disabled_pass_auth" {
  type        = bool
  description = "protocol"

}

variable "source_file" {
  type = string
  description = "Source file"
}

variable "Destination" {
  type = string
  description = "Destination path"
}

variable "admin_username" {
  type = string 
  description = "Administrator username"
}
variable "admin_password" {
  type = string
  description = "Admin password"
}
variable "host" {
  type = string
  description = "host"
}

variable "name" {
  type        = string
  description = "protocol"

}
variable "size" {
  type        = string
  description = "protocol"

}
variable "admin_username" {
  type        = string
  description = "protocol"

}
variable "admin_ssh_username" {
  type        = string
  description = "protocol"

}
variable "admin_ssh_public_key" {
  type        = string
  description = "protocol"

}
variable "os_disk_caching" {
  type        = string
  description = "protocol"

}
variable "os_disk_storage" {
  type        = string
  description = "protocol"

}
variable "os_source_publisher" {
  type        = string
  description = "protocol"

}
variable "os_source_offer" {
  type        = string
  description = "protocol"

}
variable "os_source_sku" {
  type        = string
  description = "protocol"

}
variable "os_source_version" {
  type        = string
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

variable "os_admin_username" {
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
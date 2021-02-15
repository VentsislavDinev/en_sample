
variable "name" {
  type        = string
  description = "Name"

}

variable "sku_name" {
  type        = string
  description = "sku name"

}

variable "enabled_disk_encryption" {
  type        = bool
  description = "enabled disk encryption"

}

variable "soft_enabled" {
  type        = bool
  description = "soft enabled"

}
variable "purge_enabled" {
  type        = bool
  description = "purge enabled"

}



variable "name" {
  type        = string
  description = "container image"

}

variable "sku" {
  type        = string
  description = "sku"

}

variable "admin_enabled" {
  type        = bool
  description = "admin enabled"

}

variable "georeplication_locations" {
  type        = list(string)
  description = "georeplication location"

}
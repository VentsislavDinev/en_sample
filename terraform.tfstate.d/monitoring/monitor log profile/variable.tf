
variable "name" {
  type        = string
  description = "protocol"

}

variable "categories" {
  type        = list(string)
  description = "protocol"

}

variable "locations" {
  type        = list(string)
  description = "protocol"

}

variable "retention_enabled" {
  type        = bool
  description = "protocol"

}


variable "retention_days" {
  type        = number
  description = "protocol"

}


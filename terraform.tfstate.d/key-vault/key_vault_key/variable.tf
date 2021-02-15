
variable "name" {
  type        = string
  description = "name"

}

variable "key_type" {
  type        = string
  description = "key type"

}

variable "key_size" {
  type        = string
  description = "key size"

}
variable "key_opts" {
  type        = list(string)
  description = "key opts"

}
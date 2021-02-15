
variable "name" {
  type        = string
  description = "Name"

}

variable "admin_login" {
  type        = string
  sensitive = true
  description = "user name"
}
variable "admin_login_pass" {
  type        = string
  sensitive = true
  description = "password "

}
variable "sku" {
  type        = string
  description = "sku"

}
variable "storage_mb" {
  type        = number
  description = "storage resource"

}
variable "auto_grouw" {
  type        = bool
  description = "auto grow enabled"

}
variable "backup_days" {
  type        = number
  description = "backup days"

}
variable "geo_backup_enabled" {
  type        = bool
  description = "geo backup enabled"

}
variable "public_enabled" {
  type        = bool
  description = "public enabled"

}
variable "ssl_enabled" {
  type        = bool
  description = "ssl enabled"

}
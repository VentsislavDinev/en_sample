
variable "name" {
  type        = string
  description = "name"

}
variable "protocol" {
  type        = string
  description = "protocol"

}
variable "frontend_port" {
  type        = number
  description = "frontend port"

}
variable "backend_port" {
  type        = number
  description = "backend port"

}
variable "frontend_ip_configuration" {
  type        = string
  description = "frontend ip configuration name"

}

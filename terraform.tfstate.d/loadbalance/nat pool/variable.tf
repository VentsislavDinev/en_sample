
variable "name" {
  type        = string
  description = "name"

}
variable "protocol" {
  type        = string
  description = "protocol"

}
variable "frontend_port_start" {
  type        = number
  description = "frontend port start"

}
variable "frontend_port_end" {
  type        = number
  description = "frontend port end"

}
variable "backend_port" {
  type        = number
  description = "frontend port end"

}
variable "frontend_ip_configuration_name" {
  type        = string
  description = "frontend ip configuration name"

}
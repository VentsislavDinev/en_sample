variable "subscription_id" {
    type = string
    description = "subscription id"
}

variable "client_id" {
    type = string 
    description = "client id"
}

variable "client_certificate_path" {
    type = string 
    description = "client certificate path"
}

variable "client_certificate_password" {
    type = string
    description = "certificate password"
}

variable "tenant_id" {
    type = string
    description = "tenant id"
}
variable "dns_zone_name" {
    type = string 
    description = "dns zone name"
} 
variable "storage_account_name" {
    type = string
    description = "account name"
}
variable "lb_name" {
    type = string
    description = "lb name"
}
variable "lb_backend_address_pool_name" {
    type = string
    description = "backent address pool"
}
variable "azurerm_virtual_network_name" {
    type = string
    description = "virtual network"
}
variable "container_group_name" {
    type = list(string) 
    description = "container group name"
}
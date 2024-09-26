variable "resource_config" {
    type = object({
      name = string
      location = string
    })
  
}
variable "network_config" {
    type = object({
      name = string
      address_space = string
      tags = map(string)
    })
}
variable "subnets_config" {
    type = list(object({
      name = string
      address_space = string
      tags = map(string) 
    }))
}
variable "web_nsg_info" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      priority                   = number
      description                = string
      direction                  = string # Inbound or Outbound
      access                     = string # Allow or Deny
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })

}
variable "public_ip_info" {
  type = object({
    name              = string
    allocation_method = string
    sku               = string
  })
}
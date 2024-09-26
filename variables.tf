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
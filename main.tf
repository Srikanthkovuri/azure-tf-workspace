resource "azurerm_resource_group" "test" {
    name = var.resource_config.name
    location = var.resource_config.location
  
}
resource "azurerm_virtual_network" "Vnet" {
    name = var.network_config.name
    resource_group_name = azurerm_resource_group.test.name
    address_space = [ var.network_config.address_space ]
    location = azurerm_resource_group.test.location
    tags = var.network_config.tags
}
resource "azurerm_subnet" "subnets" {
    count = length(var.subnets_config)
    name = var.subnets_config[count.index].name
    address_prefixes = [var.subnets_config[count.index].address_space]
    virtual_network_name = azurerm_virtual_network.Vnet.name
    resource_group_name = azurerm_resource_group.test.name
  
}

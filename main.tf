resource "azurerm_resource_group" "test" {
    name = var.resource_config.name
    location = var.resource_config.location
  
}
# create a virtual network
resource "azurerm_virtual_network" "Vnet" {
    name = var.network_config.name
    resource_group_name = azurerm_resource_group.test.name
    address_space = [ var.network_config.address_space ]
    location = azurerm_resource_group.test.location
    tags = var.network_config.tags
}
# create a subnets
resource "azurerm_subnet" "subnets" {
    count = length(var.subnets_config)
    name = var.subnets_config[count.index].name
    address_prefixes = [var.subnets_config[count.index].address_space]
    virtual_network_name = azurerm_virtual_network.Vnet.name
    resource_group_name = azurerm_resource_group.test.name
  
}
# create public ip

resource "azurerm_public_ip" "web" {
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
  allocation_method   = var.public_ip_info.allocation_method
  sku                 = var.public_ip_info.sku
  name                = var.public_ip_info.name
  depends_on          = [azurerm_resource_group.test]

}


# create a network interface
resource "azurerm_network_interface" "web" {
  name                = "web-nic"
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
  ip_configuration {
    name                          = "webip"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web.id
  }

  depends_on = [
    azurerm_resource_group.test,
    azurerm_subnet.subnets
  ]

}

resource "azurerm_network_interface_security_group_association" "web" {
  network_interface_id      = azurerm_network_interface.web.id
  network_security_group_id = azurerm_network_security_group.web.id
  depends_on = [
    azurerm_network_interface.web,
    azurerm_network_security_group.web
  ]
}

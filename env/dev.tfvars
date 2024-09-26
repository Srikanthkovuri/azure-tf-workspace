resource_config = {
    name = "workspace-tf"
    location = "centralindia"
}
network_config = {
    name = "Vnet-tf"
    address_space = "192.170.0.0/16"
    tags = {
        Name = "Vnet-tf"
        Env = "dev"
    }

}
subnets_config = [{
    name = "web"
    address_space = "192.170.0.0/24"
    tags = {
        Name = "web"
        Env = "dev"
    }
},
{
    name = "app"
    address_space = "192.170.1.0/24"
    tags = {
        Name = "app"
        Env = "dev"
    }
},
{
    name = "db"
    address_space = "192.170.2.0/24"
    tags = {
        Name = "db"
        Env = "dev"
    }
}]
web_nsg_info = {
  name = "web"
  rules = [{
    name                       = "openssh"
    priority                   = 300
    description                = "open ssh"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }, {
    name                       = "openhttp"
    priority                   = 350
    description                = "open http"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }, {
    name                       = "openhttps"
    priority                   = 400
    description                = "open https"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }]
}
public_ip_info = {
  name              = "webip"
  allocation_method = "Static"
  sku               = "Standard"
}
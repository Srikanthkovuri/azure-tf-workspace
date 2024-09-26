resource_config = {
    name = "workspace-tf"
    location = "centralindia"
}
network_config = {
    name = "Vnet-tf"
    address_space = "192.171.0.0/16"
    tags = {
        Name = "Vnet-tf"
        Env = "qa"
    }

}
subnets_config = [{
    name = "web"
    address_space = "192.171.0.0/24"
    tags = {
        Name = "web"
        Env = "qa"
    }
},
{
    name = "app"
    address_space = "192.171.1.0/24"
    tags = {
        Name = "app"
        Env = "qa"
    }
},
{
    name = "db"
    address_space = "192.171.2.0/24"
    tags = {
        Name = "db"
        Env = "qa"
    }
}]
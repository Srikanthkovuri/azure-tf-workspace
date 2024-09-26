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
ajayrh12 = {
  "ajayrg" = {
    name     = "ajayrg321"
    location = "centralindia"
  }
}

ajayvnet = {
  "ajayvnet1" = {
    name                = "ajayvnet213"
    location            = "centralindia"
    resource_group_name = "ajayrg321"
    address_space       = ["10.0.0.1/16"]


  }
}

ajaysubnet12 = {
  "ajaysub1" = {
    name                 = "frontend"
    resource_group_name  = "ajayrg321"
    virtual_network_name = "ajayvnet213"
    address_prefixes     = ["10.0.0.1/24"]
  }

  "ajaysub2" = {
    name                 = "backend"
    resource_group_name  = "ajayrg321"
    virtual_network_name = "ajayvnet213"
    address_prefixes     = ["10.0.0.2/24"]
  }
}

ajaypip = {
  "ajaypip1" = {
    publicip_name       = "frontendpip"
    resource_group_name = "ajayrg321"
    location            = "centralindia"
    allocation_method   = "Static"



  }

  "ajaypip2" = {
    publicip_name       = "backendpip"
    resource_group_name = "ajayrg321"
    location            = "centralindia"
    allocation_method   = "Static"

  }
}

ajaynic = {
  "ajaynic1" = {
    name                          = "frontendnic"
    location                      = "centralindia"
    resource_group_name           = "ajayrg321"
    ip_configuration_name         = "forntendipconfiguration"
    subnet_id                     = "ajaysub1"
    private_ip_address_allocation = "Dynamic"
    public_ip                     = "ajaypip1"

  }


  "ajaynic12" = {
    name                          = "backendnic"
    location                      = "centralindia"
    resource_group_name           = "ajayrg321"
    ip_configuration_name         = "backendipconfiguration"
    subnet_id                     = "ajaysub2"
    private_ip_address_allocation = "Dynamic"
    public_ip                     = "ajaypip2"


  }

}
ajaynsg = {
  "nsg1" = {
    name                    = "fronyendnsg"
    location                = "centralindia"
    resource_group_name     = "ajayrg321"
    security_rule_name      = "frontend-security-name"
    destination_port_ranges = ["80", "22"]



    "nsg2" = {
      name                    = "backendnsg"
      location                = "centralindia"
      resource_group_name     = "ajayrg321"
      security_rule_name      = "backend-security-name"
      destination_port_ranges = ["80", "22"]
    }

  }
}
ajayvm = {
  "vm1" = {
    admin_password        = ""
    admin_username        = "ajay"
    location              = "centralindia"
    name                  = "fronetendvm"
    network_interface_ids = "ajaynic1"
    offer                 = "0001-com-ubuntu-server-jammy"
    os_disk_name          = "frontenddisk"
    publisher             = "Canonical"
    resource_group_name   = "ajayrg321"
    size                  = "Standard_B2s"
    sku                   = "22_04-lts"

  }
}


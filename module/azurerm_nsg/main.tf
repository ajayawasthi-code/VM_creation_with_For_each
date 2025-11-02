resource "azurerm_network_security_group" "ajaynsg" {
    for_each = var.ajaynsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = each.value.security_rule_name
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = each.value.destination_port_ranges
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

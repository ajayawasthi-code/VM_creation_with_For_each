resource "azurerm_public_ip" "ajaypip" {
    for_each = var.ajaypip
  name                = each.value.publicip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

}
output "public_ip_ids" {

  value = { for pip_name, pip in azurerm_public_ip.ajaypip : pip_name => pip.id }
}

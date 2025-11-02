resource "azurerm_subnet" "ajaysubnet12" {
  for_each             = var.ajaysubnet12
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}
output "subnet_ids" {
  description = "Subnet IDs for all subnets"
  value       = { for k, v in azurerm_subnet.ajaysubnet12 : k => v.id }
}

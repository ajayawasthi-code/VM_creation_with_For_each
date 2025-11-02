resource "azurerm_resource_group" "ajayrh12" {
  for_each = var.ajayrh12
  name     = each.value.name
  location = each.value.location
}



module "ajayrh12" {
  source   = "../../module/azurerm_resource_group"
  ajayrh12 = var.ajayrh12

}
module "ajayvnet" {
  depends_on = [module.ajayrh12]
  source     = "../../module/azurerm_vnet"
  ajayvnet   = var.ajayvnet

}
module "ajaysubnet12" {

  depends_on   = [module.ajayvnet]
  source       = "../../module/azurerm_subnet"
  ajaysubnet12 = var.ajaysubnet12

}


module "pip" {
  depends_on = [module.ajayrh12]
  source     = "../../module/azurerm_public_ip"
  ajaypip    = var.ajaypip

}



module "ajaynic" {
  depends_on = [module.ajaysubnet12, module.pip]
  source     = "../../module/azurerm_nic"

  for_each                      = var.ajaynic
  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = each.value.resource_group_name
  ip_configuration_name         = each.value.ip_configuration_name
  private_ip_address_allocation = each.value.private_ip_address_allocation

  subnet_id            = module.ajaysubnet12.subnet_ids[each.value.subnet_id]
  public_ip_address_id = module.pip.public_ip_ids[each.value.public_ip]

}

module "nsg" {
  depends_on = [module.ajayrh12]
  source     = "../../module/azurerm_nsg"
  ajaynsg    = var.ajaynsg

}

module "vm" {
  source                = "../../module/azurerm_vm"
  depends_on = [ module.ajaynic ]
  for_each              = var.ajayvm
  admin_password        = each.value.admin_password
  admin_username        = each.value.admin_username
  location              = each.value.location
  name                  = each.value.name
  network_interface_ids = module.ajaynic[each.value.network_interface_ids].nic_ids
  offer                 = each.value.offer
  os_disk_name          = each.value.os_disk_name
  publisher             = each.value.publisher
  resource_group_name   = each.value.resource_group_name
  size                  = each.value.size
  sku                   = each.value.sku



}

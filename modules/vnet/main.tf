resource "azurerm_virtual_network" "vnet" {
  name                = "vnet01"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = var.vnet
}

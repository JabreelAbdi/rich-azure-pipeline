resource "azurerm_virtual_network" "vnet" {
  name                = "first-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.tf-practice.location
  resource_group_name = azurerm_resource_group.tf-practice.name
}

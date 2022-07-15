resource "azurerm_subnet" "subnet" {
  name                 = "first-subnet"
  resource_group_name  = azurerm_resource_group.tf-practice.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

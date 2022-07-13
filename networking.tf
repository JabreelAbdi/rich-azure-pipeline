resource "azurerm_network_security_group" "network_security_group" {
  name                = "net-sec-group"
  location            = data.azurerm_resource_group.tf-practice.location
  resource_group_name = data.azurerm_resource_group.tf-practice.name
}

resource "azurerm_network_security_rule" "network_security_rule" {
  name                        = "rule-1"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "79.67.180.73"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.tf-practice.name
  network_security_group_name = azurerm_network_security_group.network_security_group.name
}


resource "azurerm_subnet_network_security_group_association" "connection_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}

resource "azurerm_public_ip" "pub_ip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = data.azurerm_resource_group.tf-practice.name
  location            = data.azurerm_resource_group.tf-practice.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "net_inter" {
  name                = "first-nic"
  location            = data.azurerm_resource_group.tf-practice.location
  resource_group_name = data.azurerm_resource_group.tf-practice.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pub_ip.id
  }
}
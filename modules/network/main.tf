resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.rg_group
  address_space       = var.vnet_space
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = var.rg_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1_space
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1
  location            = var.location
  resource_group_name = var.rg_group

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    destination_address_prefix = "*"
    source_address_prefix      = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_association1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}


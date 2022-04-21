output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet1_name" {
  value = azurerm_subnet.subnet1.name
}

output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}
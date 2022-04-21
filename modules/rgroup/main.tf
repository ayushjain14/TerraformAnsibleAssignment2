resource "azurerm_resource_group" "rg_group" {
  name     = var.rg_group
  location = var.location
}
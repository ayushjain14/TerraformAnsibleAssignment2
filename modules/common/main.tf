resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.log_analytics_workspace["law_name"]
  location            = var.location
  resource_group_name = var.rg_group
  sku                 = var.log_analytics_workspace["log_sku"]
  retention_in_days   = var.log_analytics_workspace["retention"]

  tags = local.common_tags
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = "ayushrv"
  location            = var.location
  resource_group_name = var.rg_group
  sku                 = "Standard"
  tags                = local.common_tags
}

resource "azurerm_storage_account" "storage_acc" {
  name                     = "ayushlrssa"
  location                 = var.location
  resource_group_name      = var.rg_group
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}
